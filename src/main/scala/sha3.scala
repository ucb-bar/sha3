//see LICENSE for license
//authors: Colin Schmidt, Adam Izraelevitz
package sha3

import Chisel.Implicits._
import Chisel._

import rocket._

abstract class SimpleRoCC extends RoCC
{
  io.interrupt := Bool(false)
    // Set this true to trigger an interrupt on the processor (please refer to supervisor documentation)

  //a simple accelerator doesn't use imem or page tables
  io.imem.acquire.valid := Bool(false)
  io.imem.grant.ready := Bool(true)
  io.iptw.req.valid := Bool(false)
  io.dptw.req.valid := Bool(false)
  io.pptw.req.valid := Bool(false)
}

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
