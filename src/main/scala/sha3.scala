//see LICENSE for license
//authors: Colin Schmidt, Adam Izraelevitz
package sha3

import Chisel._
import Chisel.Implicits._
import Chisel.AdvTester._

import rocket._

class Sha3Accel() extends SimpleRoCC {
  //parameters
  val W = params[Int]("width")
  val S = params[Int]("stages")
  //constants
  val r = 2*256
  val c = 25*W - r
  val round_size_words = c/W
  val rounds = 24 //12 + 2l
  val hash_size_words = 256/W
  val bytes_per_word = W/8

  //RoCC Interface defined in testMems.scala
  //cmd
  //resp
  io.resp.valid := Bool(false) //Sha3 never returns values with the resp
  //mem
  //busy

  val ctrl = Module(new CtrlModule(W,S))
  
  ctrl.io.rocc_req_val   <> io.cmd.valid
  ctrl.io.rocc_req_rdy   <> io.cmd.ready
  ctrl.io.rocc_funct     <> io.cmd.bits.inst.funct
  ctrl.io.rocc_rs1       <> io.cmd.bits.rs1
  ctrl.io.rocc_rs2       <> io.cmd.bits.rs2
  ctrl.io.rocc_rd        <> io.cmd.bits.inst.rd
  ctrl.io.busy           <> io.busy

  ctrl.io.dmem_req_val   <> io.mem.req.valid
  ctrl.io.dmem_req_rdy   <> io.mem.req.ready
  ctrl.io.dmem_req_tag   <> io.mem.req.bits.tag
  ctrl.io.dmem_req_addr  <> io.mem.req.bits.addr
  ctrl.io.dmem_req_cmd   <> io.mem.req.bits.cmd
  ctrl.io.dmem_req_typ   <> io.mem.req.bits.typ

  ctrl.io.dmem_resp_val  <> io.mem.resp.valid
  ctrl.io.dmem_resp_tag  <> io.mem.resp.bits.tag
  ctrl.io.dmem_resp_data := io.mem.resp.bits.data

  val dpath = Module(new DpathModule(W,S))

  dpath.io.message_in <> ctrl.io.buffer_out
  io.mem.req.bits.data := dpath.io.hash_out(ctrl.io.windex)

  ctrl.io <> dpath.io

}

class Sha3AccelTests(c: Sha3Accel) extends AdvTester(c) {
  // Setup the IO handlers
  val Cmd_IHandler     = new DecoupledSource(c.io.cmd, (sckt: RoCCCommand, in: TestCmd) => in.inject(this, sckt))
  val Resp_OHandler    = new DecoupledSink(c.io.resp, (sckt: RoCCResponse) => TestResp.extract(this, sckt))
  val MemReq_OHandler  = new DecoupledSink(c.io.mem.req, (sckt: HellaCacheReq) => TestMemReq.extract(this, sckt))
  val MemResp_IHandler = new ValidSource(c.io.mem.resp, (sckt: HellaCacheResp, in: TestMemResp) => in.inject(this, sckt))

  def dutBusy = peek(c.io.busy) == 1

  // Setup some memory models
  val instantMemory = new InstantMemory(64, 64*64*2, MemReq_OHandler.outputs, MemResp_IHandler.inputs)
  val slowMemory = new SlowMemory(64, 64*64*2, MemReq_OHandler.outputs, MemResp_IHandler.inputs)
  val randomMemory = new RandomMemory(64, 64*64*2, MemReq_OHandler.outputs, MemResp_IHandler.inputs)
  //This test is the same as the one in the keccak code on github
  //https://github.com/gvanas/KeccakCodePackage/blob/master/TestVectors/KeccakF-1600-IntermediateValues.txt
  val test_message = Array.fill(c.round_size_words){BigInt(0)}
  val test_hash = Array(BigInt("F1258F7940E1DDE7",16),
                        BigInt("84D5CCF933C0478A",16),
                        BigInt("D598261EA65AA9EE",16),
                        BigInt("BD1547306F80494D",16))

  takestep()
  takestep()
  takestep()
  //Setup memory
  instantMemory.store_data(0, Array.fill(17){BigInt(0)})
  var start_cycles = cycles
  //insert both RoCC commands
  Cmd_IHandler.inputs.enqueue(TestCmd.addr(0,1024))
  Cmd_IHandler.inputs.enqueue(TestCmd.len(17*8))
  //turn tracing on
  isTrace = true
  //run test
  until( Cmd_IHandler.isIdle && !dutBusy, 450 ) {
      if(isTrace) {
      peek(c.ctrl.state)
      peek(c.ctrl.mem_s)
      peek(c.ctrl.io.absorb)
      peek(c.ctrl.areg)
      peek(c.ctrl.io.aindex)
      peek(c.ctrl.aindex)
      peek(c.ctrl.pindex)
      peek(c.ctrl.io.buffer_out)
      peek(c.ctrl.buffer_count)
      peek(c.ctrl.buffer_valid)
      peek(c.ctrl.mindex)
      peek(c.ctrl.words_filled)
      peek(c.ctrl.byte_offset)
      peek(c.ctrl.msg_len)
      peek(c.ctrl.read)
      }
  instantMemory.process() }
  
  //check answer
  var resp = instantMemory.load_addr(1024)
  assert(resp == test_hash(0), "Test failed word 0: Bad response (got %d, expected %d)".format(resp,test_hash(0)) )
  resp = instantMemory.load_addr(1024+8*1)
  assert(resp == test_hash(1), "Test failed word 1: Bad response (got %d, expected %d)".format(resp,test_hash(1)) )
  resp = instantMemory.load_addr(1024+8*2)
  assert(resp == test_hash(2), "Test failed word 2: Bad response (got %d, expected %d)".format(resp,test_hash(2)) )
  resp = instantMemory.load_addr(1024+8*3)
  assert(resp == test_hash(3), "Test failed word 3: Bad response (got %d, expected %d)".format(resp,test_hash(3)) )

  //Setup memory
  instantMemory.store_data(256, Array.fill(17){BigInt(0)})
  //insert both RoCC commands
  Cmd_IHandler.inputs.enqueue(TestCmd.addr(256,1152))
  Cmd_IHandler.inputs.enqueue(TestCmd.len(17*8))
  //run test
  until( Cmd_IHandler.isIdle && !dutBusy, 450 ) {
    if(isTrace) {
      peek(c.ctrl.state)
      peek(c.ctrl.mem_s)
      peek(c.ctrl.mindex)
      peek(c.ctrl.buffer_count)
      peek(c.ctrl.io.buffer_out)
      peek(c.ctrl.io.absorb)
    }
  instantMemory.process() }
  
  //check answer
  resp = instantMemory.load_addr(1152)
  assert(resp == test_hash(0), "Test failed word 0: Bad response (got %d, expected %d)".format(resp,test_hash(0)) )
  resp = instantMemory.load_addr(1152+8*1)
  assert(resp == test_hash(1), "Test failed word 1: Bad response (got %d, expected %d)".format(resp,test_hash(1)) )
  resp = instantMemory.load_addr(1152+8*2)
  assert(resp == test_hash(2), "Test failed word 2: Bad response (got %d, expected %d)".format(resp,test_hash(2)) )
  resp = instantMemory.load_addr(1152+8*3)
  assert(resp == test_hash(3), "Test failed word 3: Bad response (got %d, expected %d)".format(resp,test_hash(3)) )

    println("Test 1: Execute empty message hash")
    start_cycles = cycles
    instantMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 1024))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(150))
    until( Cmd_IHandler.isIdle && !dutBusy, 450 ) {
      if(isTrace) {
      peek(c.ctrl.state)
      peek(c.ctrl.mem_s)
      peek(c.ctrl.io.absorb)
      peek(c.ctrl.areg)
      peek(c.ctrl.io.aindex)
      peek(c.ctrl.aindex)
      peek(c.ctrl.pindex)
      peek(c.ctrl.io.buffer_out)
      peek(c.ctrl.buffer_count)
      peek(c.ctrl.buffer_valid)
      peek(c.ctrl.mindex)
      peek(c.ctrl.words_filled)
      peek(c.ctrl.byte_offset)
      peek(c.ctrl.msg_len)
      peek(c.ctrl.read)
      peek(c.dpath.io.hash_out)
      }
      instantMemory.process() }
    println("Test 1 took "+(cycles-start_cycles)+" cycles and had "+instantMemory.reqs_handled+" requests for a util of "+instantMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t1_resp = instantMemory.load_addr(1024)
    t1_resp = instantMemory.load_addr(1024)
    assert( t1_resp == BigInt("1f56d343d99dccdd", 16), "Test 1 failed: Bad response (got %d, expected %d)".format(t1_resp, BigInt("1f56d343d99dccdd", 16)) )
    t1_resp = instantMemory.load_addr(1032)
    assert( t1_resp == BigInt("1ac1c261f52ca836", 16), "Test 1 failed: Bad response (got %d, expected %d)".format(t1_resp, BigInt("1ac1c261f52ca836", 16)) )
    t1_resp = instantMemory.load_addr(1040)
    assert( t1_resp == BigInt("ae278642a6872aea", 16), "Test 1 failed: Bad response (got %d, expected %d)".format(t1_resp, BigInt("ae278642a6872aea", 16)) )
    t1_resp = instantMemory.load_addr(1048)
    assert( t1_resp == BigInt("ee392a8995033db8", 16), "Test 1 failed: Bad response (got %d, expected %d)".format(t1_resp, BigInt("ee392a8995033db8", 16)) )

    println("Test 2: Execute length zero hash")
    start_cycles = cycles
    instantMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 1024))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(0))
    until( Cmd_IHandler.isIdle && !dutBusy, 5000 ) {
      if(isTrace) {
      peek(c.ctrl.state)
      peek(c.ctrl.mem_s)
      peek(c.ctrl.io.absorb)
      peek(c.ctrl.areg)
      peek(c.ctrl.io.aindex)
      peek(c.ctrl.aindex)
      peek(c.ctrl.pindex)
      peek(c.ctrl.io.buffer_out)
      peek(c.ctrl.buffer_reg_raddr)
      peek(c.ctrl.buffer_rdata)
      peek(c.ctrl.buffer_wen)
      peek(c.ctrl.buffer_waddr)
      peek(c.ctrl.buffer_wdata)

      peek(c.ctrl.buffer_count)
      peek(c.ctrl.buffer_valid)
      peek(c.ctrl.mindex)
      peek(c.ctrl.words_filled)
      peek(c.ctrl.byte_offset)
      peek(c.ctrl.msg_len)
      peek(c.ctrl.read)
      }
      instantMemory.process() }
    println("Test 2 took "+(cycles-start_cycles)+" cycles and had "+instantMemory.reqs_handled+" requests for a util of "+instantMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t2_resp = instantMemory.load_addr(1024)
    t2_resp = instantMemory.load_addr(1024)
    assert( t2_resp == BigInt("3c23f7860146d2c5", 16), "Test 2 failed: Bad response (got %d, expected %d)".format(t2_resp, BigInt("c923f7860146d23c5", 16)) )
    t2_resp = instantMemory.load_addr(1032)
    assert( t2_resp == BigInt("c003c7dcb27d7e92", 16), "Test 2 failed: Bad response (got %d, expected %d)".format(t2_resp, BigInt("c003c7dcb27d7e92", 16)) )
    t2_resp = instantMemory.load_addr(1040)
    assert( t2_resp == BigInt("3b2782ca53b600e5", 16), "Test 2 failed: Bad response (got %d, expected %d)".format(t2_resp, BigInt("3b2782ca53b600e5", 16)) )
    t2_resp = instantMemory.load_addr(1048)
    assert( t2_resp == BigInt("70a4855d04d8fa7b", 16), "Test 2 failed: Bad response (got %d, expected %d)".format(t2_resp, BigInt("70a4855d04d8fa7b", 16)) )

    //Test with some real data Hash for "Colin"
    println("Test 3: Execute \"Colin\" message hash")
    instantMemory.store_data(0, Array(BigInt("6e696c6f43",16)))//who knows if this works
    start_cycles = cycles
    instantMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 1024))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(5))
    until( Cmd_IHandler.isIdle && !dutBusy, 5000 ) {
      if(isTrace) {
      peek(c.ctrl.state)
      peek(c.ctrl.mem_s)
      peek(c.ctrl.io.absorb)
      peek(c.ctrl.areg)
      peek(c.ctrl.io.aindex)
      peek(c.ctrl.aindex)
      peek(c.ctrl.io.buffer_out)
      peek(c.ctrl.buffer_count)
      peek(c.ctrl.buffer_valid)
      peek(c.ctrl.mindex)
      peek(c.ctrl.words_filled)
      peek(c.ctrl.byte_offset)
      peek(c.ctrl.msg_len)
      peek(c.ctrl.read)
      }
      instantMemory.process() }
    println("Test 3 took "+(cycles-start_cycles)+" cycles and had "+instantMemory.reqs_handled+" requests for a util of "+instantMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t3_resp = instantMemory.load_addr(1024)
    t3_resp = instantMemory.load_addr(1024)
    
    assert( t3_resp == BigInt("914cfd34d187e685", 16), "Test 3 failed: Bad response (got %d, expected %d)".format(t3_resp, BigInt("914cfd34d187e685", 16)) )
    t3_resp = instantMemory.load_addr(1032)
    assert( t3_resp == BigInt("e3422797ab78c1f5", 16), "Test 3 failed: Bad response (got %d, expected %d)".format(t3_resp, BigInt("e3422797ab78c1f5", 16)) )
    t3_resp = instantMemory.load_addr(1040)
    assert( t3_resp == BigInt("4224c0b0b923f542", 16), "Test 3 failed: Bad response (got %d, expected %d)".format(t3_resp, BigInt("4224c0b0b923f542", 16)) )
    t3_resp = instantMemory.load_addr(1048)
    assert( t3_resp == BigInt("7ee226cb0dd290ae", 16), "Test 3 failed: Bad response (got %d, expected %d)".format(t3_resp, BigInt("7ee226cb0dd290ae", 16)) )

    //Test both_pad
    println("Test 4: try inserting both_pad")
    instantMemory.store_data(0, Array.fill(16){BigInt("3837363534333231",16)})
    instantMemory.store_data(16*8, Array(BigInt("37363534333231",16)))
    start_cycles = cycles
    instantMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 1024))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(17*8-1))
    until( Cmd_IHandler.isIdle && !dutBusy, 5000 ) {
      if(isTrace) {
      peek(c.ctrl.state)
      peek(c.ctrl.mem_s)
      peek(c.ctrl.io.absorb)
      peek(c.ctrl.areg)
      peek(c.ctrl.io.aindex)
      peek(c.ctrl.aindex)
      peek(c.ctrl.pindex)
      peek(c.ctrl.io.buffer_out)
      peek(c.ctrl.buffer_count)
      peek(c.ctrl.buffer_valid)
      peek(c.ctrl.mindex)
      peek(c.ctrl.words_filled)
      peek(c.ctrl.byte_offset)
      peek(c.ctrl.msg_len)
      peek(c.ctrl.read)
      }
      instantMemory.process() }
    println("Test 4 took "+(cycles-start_cycles)+" cycles and had "+instantMemory.reqs_handled+" requests for a util of "+instantMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t4_resp = instantMemory.load_addr(1024)
    t4_resp = instantMemory.load_addr(1024)

    assert( t4_resp == BigInt("77de177a77db4737", 16), "Test 4 failed: Bad response (got %d, expected %d)".format(t4_resp, BigInt("77de177a77db4737", 16)) )
    t4_resp = instantMemory.load_addr(1032)
    assert( t4_resp == BigInt("1ff817cb6c28898d", 16), "Test 4 failed: Bad response (got %d, expected %d)".format(t4_resp, BigInt("1ff817cb6c28898d", 16)) )
    t4_resp = instantMemory.load_addr(1040)
    assert( t4_resp == BigInt("e51c4792fc4164db", 16), "Test 4 failed: Bad response (got %d, expected %d)".format(t4_resp, BigInt("e51c4792fc4164db", 16)) )
    t4_resp = instantMemory.load_addr(1048)
    assert( t4_resp == BigInt("883b4bef3d542ac4", 16), "Test 4 failed: Bad response (got %d, expected %d)".format(t4_resp, BigInt("883b4bef3d542ac4", 16)) )

    //Test long(128 words) message with simple memory
    println("Test 5: try long message")
    instantMemory.store_data(0, Array.fill(128){BigInt("3736353433323130",16)})
    start_cycles = cycles
    instantMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 1024))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(128*8))
    until( Cmd_IHandler.isIdle && !dutBusy, 5000 ) {
      if(isTrace) {
      peek(c.ctrl.state)
      peek(c.ctrl.mem_s)
      peek(c.ctrl.io.absorb)
      peek(c.ctrl.areg)
      peek(c.ctrl.io.aindex)
      peek(c.ctrl.aindex)
      peek(c.ctrl.pindex)
      peek(c.ctrl.io.buffer_out)
      peek(c.ctrl.buffer_count)
      peek(c.ctrl.buffer_valid)
      peek(c.ctrl.mindex)
      peek(c.ctrl.words_filled)
      peek(c.ctrl.byte_offset)
      peek(c.ctrl.msg_len)
      peek(c.ctrl.read)
      }
      instantMemory.process() }
    println("Test 5 took "+(cycles-start_cycles)+" cycles and had "+instantMemory.reqs_handled+" requests for a util of "+instantMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t5_resp = instantMemory.load_addr(1024)
    t5_resp = instantMemory.load_addr(1024)

    assert( t5_resp == BigInt("3409e87d9417ee85", 16), "Test 5 failed: Bad response (got %d, expected %d)".format(t5_resp, BigInt("3409e87d9417ee85", 16)) )
    t5_resp = instantMemory.load_addr(1032)
    assert( t5_resp == BigInt("43188e3fbef8e88e", 16), "Test 5 failed: Bad response (got %d, expected %d)".format(t5_resp, BigInt("43188e3fbef8e88e", 16)) )
    t5_resp = instantMemory.load_addr(1040)
    assert( t5_resp == BigInt("de23efc5dcf43dd2", 16), "Test 5 failed: Bad response (got %d, expected %d)".format(t5_resp, BigInt("de23efc5dcf43dd2", 16)) )
    t5_resp = instantMemory.load_addr(1048)
    assert( t5_resp == BigInt("05d30ef9199e671f", 16), "Test 5 failed: Bad response (got %d, expected %d)".format(t5_resp, BigInt("05d30ef9199e671f", 16)) )
    //Test long(128 words) message with complex memory
    println("Switch to more random memory model.")
    MemReq_OHandler.max_count = 1 // only allow 1 un-received request so DUT gets some backpressure
    println("Test 6: try long message with random memory")
    randomMemory.store_data(0, Array.fill(128){BigInt("3736353433323130",16)})
    start_cycles = cycles  
    randomMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 1024))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(128*8)) 
    until( Cmd_IHandler.isIdle && !dutBusy, 5000 ) {
      if(isTrace) {
      peek(c.ctrl.state)
      peek(c.ctrl.mem_s)
      peek(c.ctrl.io.absorb)
      peek(c.ctrl.areg)
      peek(c.ctrl.io.aindex)
      peek(c.ctrl.aindex)
      peek(c.ctrl.io.buffer_out)
      peek(c.ctrl.buffer_count)
      peek(c.ctrl.buffer_valid)
      peek(c.ctrl.mindex)
      peek(c.ctrl.words_filled)
      peek(c.ctrl.byte_offset)
      peek(c.ctrl.msg_len)
      peek(c.ctrl.read)
      }
      randomMemory.process() }
    println("Test 6 took "+(cycles-start_cycles)+" cycles and had "+randomMemory.reqs_handled+" requests for a util of "+randomMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t6_resp = randomMemory.load_addr(1024)
    t6_resp = randomMemory.load_addr(1024)

    assert( t6_resp == BigInt("3409e87d9417ee85", 16), "Test 6 failed: Bad response (got %d, expected %d)".format(t6_resp, BigInt("3409e87d9417ee85", 16)) )
    t6_resp = randomMemory.load_addr(1032)
    assert( t6_resp == BigInt("43188e3fbef8e88e", 16), "Test 6 failed: Bad response (got %d, expected %d)".format(t6_resp, BigInt("43188e3fbef8e88e", 16)) )
    t6_resp = randomMemory.load_addr(1040)
    assert( t6_resp == BigInt("de23efc5dcf43dd2", 16), "Test 6 failed: Bad response (got %d, expected %d)".format(t6_resp, BigInt("de23efc5dcf43dd2", 16)) )
    t6_resp = randomMemory.load_addr(1048)
    assert( t6_resp == BigInt("05d30ef9199e671f", 16), "Test 6 failed: Bad response (got %d, expected %d)".format(t6_resp, BigInt("05d30ef9199e671f", 16)) )

    //Test long(128 words) message with complex memory
    println("Switch to more hellachache memory model.")
    MemReq_OHandler.max_count = 2 // only allow 1 un-received request so DUT gets some backpressure
    println("Test 7: try long message with const slow memory")
    slowMemory.store_data(0, Array.fill(128){BigInt("3736353433323130",16)})
    start_cycles = cycles  
    slowMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 1024))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(128*8)) 
    until( Cmd_IHandler.isIdle && !dutBusy, 5000 ) { slowMemory.process() }
    println("Test 7 took "+(cycles-start_cycles)+" cycles and had "+slowMemory.reqs_handled+" requests for a util of "+slowMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t7_resp = slowMemory.load_addr(1024)
    t7_resp = slowMemory.load_addr(1024)

    assert( t7_resp == BigInt("3409e87d9417ee85", 16), "Test 7 failed: Bad response (got %d, expected %d)".format(t7_resp, BigInt("3409e87d9417ee85", 16)) )
    t7_resp = slowMemory.load_addr(1032)
    assert( t7_resp == BigInt("43188e3fbef8e88e", 16), "Test 7 failed: Bad response (got %d, expected %d)".format(t7_resp, BigInt("43188e3fbef8e88e", 16)) )
    t7_resp = slowMemory.load_addr(1040)
    assert( t7_resp == BigInt("de23efc5dcf43dd2", 16), "Test 7 failed: Bad response (got %d, expected %d)".format(t7_resp, BigInt("de23efc5dcf43dd2", 16)) )
    t7_resp = slowMemory.load_addr(1048)
    assert( t7_resp == BigInt("05d30ef9199e671f", 16), "Test 7 failed: Bad response (got %d, expected %d)".format(t7_resp, BigInt("05d30ef9199e671f", 16)) )

    //Test 1024 word message
    MemReq_OHandler.max_count = 2 // only allow 1 un-received request so DUT gets some backpressure
    println("Test 8: try long message with const slow memory")
    slowMemory.store_data(0, Array.fill(1024){BigInt("3736353433323130",16)})
    start_cycles = cycles  
    slowMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 1024))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(1024*8)) 
    until( Cmd_IHandler.isIdle && !dutBusy, 20000 ) { slowMemory.process() }
    println("Test 8 took "+(cycles-start_cycles)+" cycles and had "+slowMemory.reqs_handled+" requests for a util of "+slowMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t8_resp = slowMemory.load_addr(1024)
    t8_resp = slowMemory.load_addr(1024)

    assert( t8_resp == BigInt("d150414e3f6467d6", 16), "Test 8 failed: Bad response (got %d, expected %d)".format(t8_resp, BigInt("d150414e3f6467d6", 16)) )
    t8_resp = slowMemory.load_addr(1032)
    assert( t8_resp == BigInt("2e64ecddaac3fde3", 16), "Test 8 failed: Bad response (got %d, expected %d)".format(t8_resp, BigInt("2e64ecddaac3fde3", 16)) )
    t8_resp = slowMemory.load_addr(1040)
    assert( t8_resp == BigInt("826f6c4aa2b63b04", 16), "Test 8 failed: Bad response (got %d, expected %d)".format(t8_resp, BigInt("826f6c4aa2b63b04", 16)) )
    t8_resp = slowMemory.load_addr(1048)
    assert( t8_resp == BigInt("53b320ce486f313f", 16), "Test 8 failed: Bad response (got %d, expected %d)".format(t8_resp, BigInt("53b320ce486f313f", 16)) )

    println("Start multi-threading tests")
    println("Test 9: Execute two empty message hashes")
    slowMemory.store_data(0, Array.fill(2){BigInt("0000000000000000",16)})
    start_cycles = cycles
    slowMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 1024))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(0))
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(8, 1056))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(0))
    until( Cmd_IHandler.isIdle && !dutBusy, 5000 ) { slowMemory.process() }
    println("Test 9 took "+(cycles-start_cycles)+" cycles and had "+slowMemory.reqs_handled+" requests for a util of "+slowMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t9_resp = slowMemory.load_addr(1024)
    t9_resp = slowMemory.load_addr(1024)
    assert( t9_resp == BigInt("3c23f7860146d2c5", 16), "Test 9 failed: Bad response (got %d, expected %d)".format(t9_resp, BigInt("c923f7860146d23c5", 16)) )
    t9_resp = slowMemory.load_addr(1032)
    assert( t9_resp == BigInt("c003c7dcb27d7e92", 16), "Test 9 failed: Bad response (got %d, expected %d)".format(t9_resp, BigInt("c003c7dcb27d7e92", 16)) )
    t9_resp = slowMemory.load_addr(1040)
    assert( t9_resp == BigInt("3b2782ca53b600e5", 16), "Test 9 failed: Bad response (got %d, expected %d)".format(t9_resp, BigInt("3b2782ca53b600e5", 16)) )
    t9_resp = slowMemory.load_addr(1048)
    assert( t9_resp == BigInt("70a4855d04d8fa7b", 16), "Test 9 failed: Bad response (got %d, expected %d)".format(t9_resp, BigInt("70a4855d04d8fa7b", 16)) )
    t9_resp = slowMemory.load_addr(1056)
    assert( t9_resp == BigInt("3c23f7860146d2c5", 16), "Test 9 failed: Bad response (got %d, expected %d)".format(t9_resp, BigInt("3c23f7860146d2c5", 16)) )
    t9_resp = slowMemory.load_addr(1064)
    assert( t9_resp == BigInt("c003c7dcb27d7e92", 16), "Test 9 failed: Bad response (got %d, expected %d)".format(t9_resp, BigInt("c003c7dcb27d7e92", 16)) )
    t9_resp = slowMemory.load_addr(1072)
    assert( t9_resp == BigInt("3b2782ca53b600e5", 16), "Test 9 failed: Bad response (got %d, expected %d)".format(t9_resp, BigInt("3b2782ca53b600e5", 16)) )
    t9_resp = slowMemory.load_addr(1080)
    assert( t9_resp == BigInt("70a4855d04d8fa7b", 16), "Test 9 failed: Bad response (got %d, expected %d)".format(t9_resp, BigInt("70a4855d04d8fa7b", 16)) )

    println("Test 10: Execute two short non-empty message hashes")
    slowMemory.store_data(0, Array(BigInt("6e696c6f43",16)))//who knows if this works
    slowMemory.store_data(8, Array(BigInt("6d616441",16)))//who knows if this works
    start_cycles = cycles
    slowMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 1024))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(5))
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(8, 1056))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(4))
    until( Cmd_IHandler.isIdle && !dutBusy, 5000 ) {
      if(isTrace) {
      peek(c.ctrl.state)
      peek(c.ctrl.mem_s)
      peek(c.ctrl.io.absorb)
      peek(c.ctrl.areg)
      peek(c.ctrl.io.aindex)
      peek(c.ctrl.aindex)
      peek(c.ctrl.pindex)
      peek(c.ctrl.io.buffer_out)
      peek(c.ctrl.buffer_count)
      peek(c.ctrl.buffer_valid)
      peek(c.ctrl.mindex)
      peek(c.ctrl.words_filled)
      peek(c.ctrl.byte_offset)
      peek(c.ctrl.msg_len)
      peek(c.ctrl.read)
      }
      slowMemory.process() }
    println("Test 10 took "+(cycles-start_cycles)+" cycles and had "+slowMemory.reqs_handled+" requests for a util of "+slowMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t10_resp = slowMemory.load_addr(1024)
    assert( t10_resp == BigInt("914cfd34d187e685", 16), "Test 10 failed: Bad response (got %d, expected %d)".format(t10_resp, BigInt("914cfd34d187e685", 16)) )
    t10_resp = slowMemory.load_addr(1032)
    assert( t10_resp == BigInt("e3422797ab78c1f5", 16), "Test 10 failed: Bad response (got %d, expected %d)".format(t10_resp, BigInt("e3422797ab78c1f5", 16)) )
    t10_resp = slowMemory.load_addr(1040)
    assert( t10_resp == BigInt("4224c0b0b923f542", 16), "Test 10 failed: Bad response (got %d, expected %d)".format(t10_resp, BigInt("4224c0b0b923f542", 16)) )
    t10_resp = slowMemory.load_addr(1048)
    assert( t10_resp == BigInt("7ee226cb0dd290ae", 16), "Test 10 failed: Bad response (got %d, expected %d)".format(t10_resp, BigInt("7ee226cb0dd290ae", 16)) )
    t10_resp = slowMemory.load_addr(1056)
    assert( t10_resp == BigInt("fac8264e5eda0df8", 16), "Test 10 failed: Bad response (got %d, expected %d)".format(t10_resp, BigInt("fac8264e5eda0df8", 16)) )
    t10_resp = slowMemory.load_addr(1064)
    assert( t10_resp == BigInt("0795848434c8a68d", 16), "Test 10 failed: Bad response (got %d, expected %d)".format(t10_resp, BigInt("0795848434c8a68d", 16)) )
    t10_resp = slowMemory.load_addr(1072)
    assert( t10_resp == BigInt("3f1173da52517866", 16), "Test 10 failed: Bad response (got %d, expected %d)".format(t10_resp, BigInt("3f1173da52517866", 16)) )
    t10_resp = slowMemory.load_addr(1080)
    assert( t10_resp == BigInt("5e86a4cdcbad8a0d", 16), "Test 10 failed: Bad response (got %d, expected %d)".format(t10_resp, BigInt("5e86a4cdcbad8a0d", 16)) )


    println("Test 11: Execute one 128 and one 1024 word message hashes")
    slowMemory.store_data(0, Array.fill(128){BigInt("3736353433323130",16)})
    slowMemory.store_data(1024, Array.fill(1024){BigInt("3736353433323130",16)})
    start_cycles = cycles
    slowMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(1024, 9248))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(1024*8))
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 9216))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(128*8))
    until( Cmd_IHandler.isIdle && !dutBusy, 20000 ) { slowMemory.process() }
    println("Test 11 took "+(cycles-start_cycles)+" cycles and had "+slowMemory.reqs_handled+" requests for a util of "+slowMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t11_resp = slowMemory.load_addr(9216)
    assert( t11_resp == BigInt("3409e87d9417ee85", 16), "Test 11 failed: Bad response (got %d, expected %d)".format(t11_resp, BigInt("3409e87d9417ee85", 16)) )
    t11_resp = slowMemory.load_addr(9224)
    assert( t11_resp == BigInt("43188e3fbef8e88e", 16), "Test 11 failed: Bad response (got %d, expected %d)".format(t11_resp, BigInt("43188e3fbef8e88e", 16)) )
    t11_resp = slowMemory.load_addr(9232)
    assert( t11_resp == BigInt("de23efc5dcf43dd2", 16), "Test 11 failed: Bad response (got %d, expected %d)".format(t11_resp, BigInt("de23efc5dcf43dd2", 16)) )
    t11_resp = slowMemory.load_addr(9240)
    assert( t11_resp == BigInt("05d30ef9199e671f", 16), "Test 11 failed: Bad response (got %d, expected %d)".format(t11_resp, BigInt("05d30ef9199e671f", 16)) )
    t11_resp = slowMemory.load_addr(9248)
    assert( t11_resp == BigInt("d150414e3f6467d6", 16), "Test 11 failed: Bad response to big hash (got %d, expected %d)".format(t11_resp, BigInt("d150414e3f6467d6", 16)) )
    t11_resp = slowMemory.load_addr(9256)
    assert( t11_resp == BigInt("2e64ecddaac3fde3", 16), "Test 11 failed: Bad response to big hash (got %d, expected %d)".format(t11_resp, BigInt("2e64ecddaac3fde3", 16)) )
    t11_resp = slowMemory.load_addr(9264)
    assert( t11_resp == BigInt("826f6c4aa2b63b04", 16), "Test 11 failed: Bad response to big hash (got %d, expected %d)".format(t11_resp, BigInt("826f6c4aa2b63b04", 16)) )
    t11_resp = slowMemory.load_addr(9272)
    assert( t11_resp == BigInt("53b320ce486f313f", 16), "Test 11 failed: Bad response to big hash (got %d, expected %d)".format(t11_resp, BigInt("53b320ce486f313f", 16)) )

    //long test?
    println("Test 12: Execute eight 1024 word message hashes")
    slowMemory.store_data(0, Array.fill(1024){BigInt("3736353433323130",16)})
    start_cycles = cycles
    slowMemory.reqs_handled = 0 
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 8192))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(1024*8))
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 8224))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(1024*8))
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 8256))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(1024*8))
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 8288))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(1024*8))
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 8320))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(1024*8))
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 8352))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(1024*8))
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 8384))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(1024*8))
    Cmd_IHandler.inputs.enqueue(TestCmd.addr(0, 8416))
    Cmd_IHandler.inputs.enqueue(TestCmd.len(1024*8))
    until( Cmd_IHandler.isIdle && !dutBusy, 80000 ) { 
      if(isTrace) {

      peek(c.ctrl.state)
      peek(c.ctrl.mem_s)
      peek(c.ctrl.io.absorb)
      peek(c.ctrl.areg)
      peek(c.ctrl.io.aindex)
      peek(c.ctrl.aindex)
      peek(c.ctrl.io.buffer_out)
      peek(c.ctrl.buffer_count)
      peek(c.ctrl.buffer_valid)
      peek(c.ctrl.mindex)
      peek(c.ctrl.words_filled)
      peek(c.ctrl.byte_offset)
      peek(c.ctrl.msg_len)
      peek(c.ctrl.read)

      }
      slowMemory.process() }
    println("Test 12 took "+(cycles-start_cycles)+" cycles and had "+slowMemory.reqs_handled+" requests for a util of "+slowMemory.reqs_handled/(cycles-start_cycles).toDouble)
    var t12_resp = slowMemory.load_addr(8192)
    assert( t12_resp == BigInt("d150414e3f6467d6", 16), "Test 12(1,1) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("d150414e3f6467d6", 16)) )
    t12_resp = slowMemory.load_addr(8200)
    assert( t12_resp == BigInt("2e64ecddaac3fde3", 16), "Test 12(1,2) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("2e64ecddaac3fde3", 16)) )
    t12_resp = slowMemory.load_addr(8208)
    assert( t12_resp == BigInt("826f6c4aa2b63b04", 16), "Test 12(1,3) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("826f6c4aa2b63b04", 16)) )
    t12_resp = slowMemory.load_addr(8216)
    assert( t12_resp == BigInt("53b320ce486f313f", 16), "Test 12(1,4) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("53b320ce486f313f", 16)) )
    t12_resp = slowMemory.load_addr(8224)
    assert( t12_resp == BigInt("d150414e3f6467d6", 16), "Test 12(2,1) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("d150414e3f6467d6", 16)) )
    t12_resp = slowMemory.load_addr(8232)
    assert( t12_resp == BigInt("2e64ecddaac3fde3", 16), "Test 12(2,2) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("2e64ecddaac3fde3", 16)) )
    t12_resp = slowMemory.load_addr(8240)
    assert( t12_resp == BigInt("826f6c4aa2b63b04", 16), "Test 12(2,3) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("826f6c4aa2b63b04", 16)) )
    t12_resp = slowMemory.load_addr(8248)
    assert( t12_resp == BigInt("53b320ce486f313f", 16), "Test 12(2,4) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("53b320ce486f313f", 16)) )
    t12_resp = slowMemory.load_addr(8256)
    assert( t12_resp == BigInt("d150414e3f6467d6", 16), "Test 12(3,1) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("d150414e3f6467d6", 16)) )
    t12_resp = slowMemory.load_addr(8264)
    assert( t12_resp == BigInt("2e64ecddaac3fde3", 16), "Test 12(3,2) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("2e64ecddaac3fde3", 16)) )
    t12_resp = slowMemory.load_addr(8272)
    assert( t12_resp == BigInt("826f6c4aa2b63b04", 16), "Test 12(3,3) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("826f6c4aa2b63b04", 16)) )
    t12_resp = slowMemory.load_addr(8280)
    assert( t12_resp == BigInt("53b320ce486f313f", 16), "Test 12(3,4) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("53b320ce486f313f", 16)) )
    t12_resp = slowMemory.load_addr(8288)
    assert( t12_resp == BigInt("d150414e3f6467d6", 16), "Test 12(4,1) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("d150414e3f6467d6", 16)) )
    t12_resp = slowMemory.load_addr(8296)
    assert( t12_resp == BigInt("2e64ecddaac3fde3", 16), "Test 12(4,2) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("2e64ecddaac3fde3", 16)) )
    t12_resp = slowMemory.load_addr(8304)
    assert( t12_resp == BigInt("826f6c4aa2b63b04", 16), "Test 12(4,3) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("826f6c4aa2b63b04", 16)) )
    t12_resp = slowMemory.load_addr(8312)
    assert( t12_resp == BigInt("53b320ce486f313f", 16), "Test 12(4,4) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("53b320ce486f313f", 16)) )
    t12_resp = slowMemory.load_addr(8320)
    assert( t12_resp == BigInt("d150414e3f6467d6", 16), "Test 12(5,1) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("d150414e3f6467d6", 16)) )
    t12_resp = slowMemory.load_addr(8328)
    assert( t12_resp == BigInt("2e64ecddaac3fde3", 16), "Test 12(5,2) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("2e64ecddaac3fde3", 16)) )
    t12_resp = slowMemory.load_addr(8336)
    assert( t12_resp == BigInt("826f6c4aa2b63b04", 16), "Test 12(5,3) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("826f6c4aa2b63b04", 16)) )
    t12_resp = slowMemory.load_addr(8344)
    assert( t12_resp == BigInt("53b320ce486f313f", 16), "Test 12(5,4) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("53b320ce486f313f", 16)) )
    t12_resp = slowMemory.load_addr(8352)
    assert( t12_resp == BigInt("d150414e3f6467d6", 16), "Test 12(6,1) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("d150414e3f6467d6", 16)) )
    t12_resp = slowMemory.load_addr(8360)
    assert( t12_resp == BigInt("2e64ecddaac3fde3", 16), "Test 12(6,2) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("2e64ecddaac3fde3", 16)) )
    t12_resp = slowMemory.load_addr(8368)
    assert( t12_resp == BigInt("826f6c4aa2b63b04", 16), "Test 12(6,3) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("826f6c4aa2b63b04", 16)) )
    t12_resp = slowMemory.load_addr(8376)
    assert( t12_resp == BigInt("53b320ce486f313f", 16), "Test 12(6,4) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("53b320ce486f313f", 16)) )
    t12_resp = slowMemory.load_addr(8384)
    assert( t12_resp == BigInt("d150414e3f6467d6", 16), "Test 12(7,1) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("d150414e3f6467d6", 16)) )
    t12_resp = slowMemory.load_addr(8392)
    assert( t12_resp == BigInt("2e64ecddaac3fde3", 16), "Test 12(7,2) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("2e64ecddaac3fde3", 16)) )
    t12_resp = slowMemory.load_addr(8400)
    assert( t12_resp == BigInt("826f6c4aa2b63b04", 16), "Test 12(7,3) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("826f6c4aa2b63b04", 16)) )
    t12_resp = slowMemory.load_addr(8408)
    assert( t12_resp == BigInt("53b320ce486f313f", 16), "Test 12(7,4) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("53b320ce486f313f", 16)) )
    t12_resp = slowMemory.load_addr(8416)
    assert( t12_resp == BigInt("d150414e3f6467d6", 16), "Test 12(8,1) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("d150414e3f6467d6", 16)) )
    t12_resp = slowMemory.load_addr(8424)
    assert( t12_resp == BigInt("2e64ecddaac3fde3", 16), "Test 12(8,2) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("2e64ecddaac3fde3", 16)) )
    t12_resp = slowMemory.load_addr(8432)
    assert( t12_resp == BigInt("826f6c4aa2b63b04", 16), "Test 12(8,3) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("826f6c4aa2b63b04", 16)) )
    t12_resp = slowMemory.load_addr(8440)
    assert( t12_resp == BigInt("53b320ce486f313f", 16), "Test 12(8,4) failed: Bad response (got %d, expected %d)".format(t12_resp, BigInt("53b320ce486f313f", 16)) )
}

object Sha3AccelMain {
  def main(args: Array[String]): Unit = {
    chiselMain.run(args, () => (new Sha3Accel()),
                ((c:Sha3Accel) => new Sha3AccelTests(c)))
              }
            }

class DefaultConfig() extends ChiselConfig {
  override val topDefinitions:World.TopDefs = {
    (pname,site,here) => pname match {
      case "width" => 64
      case "stages" => Knob("stages")
      case "fast_mem" => Knob("fast_mem")
      case "buffer_sram" => Dump(Knob("buffer_sram"))
      //case "multi_vt" => Dump(Knob("multi_vt"))
    }
  }
  override val topConstraints:List[ViewSym=>Ex[Boolean]] = List(
    ex => ex[Int]("width") === 64,
    ex => ex[Int]("stages") >= 1 && ex[Int]("stages") <= 4 && (ex[Int]("stages")%2 === 0 || ex[Int]("stages") === 1),
    ex => ex[Boolean]("fast_mem") === ex[Boolean]("fast_mem"),
    ex => ex[Boolean]("buffer_sram") === ex[Boolean]("buffer_sram")
    //ex => ex[Boolean]("multi_vt") === ex[Boolean]("multi_vt")
  )
  override val knobValues:Any=>Any = {
    case "stages" => 1
    case "fast_mem" => true
    case "buffer_sram" => false
    //case "multi_vt" => true
  }
}
