package sha3

import scala.util.Random

import Chisel._
import Chisel.Implicits._
import Chisel.AdvTester._

import rocket._
//import uncore.{RoCCCommand,RoCCResponse,HellaCacheReq,HellaCacheResp}
import uncore.constants.MemoryOpConstants._

//Rocket Custom Instructions 

/*
object Instructions {
  def CUSTOM0            = Bits("b?????????????????000?????0001011")
  def CUSTOM0_RS1        = Bits("b?????????????????010?????0001011")
  def CUSTOM0_RS1_RS2    = Bits("b?????????????????011?????0001011")
  def CUSTOM0_RD         = Bits("b?????????????????100?????0001011")
  def CUSTOM0_RD_RS1     = Bits("b?????????????????110?????0001011")
  def CUSTOM0_RD_RS1_RS2 = Bits("b?????????????????111?????0001011")
  def CUSTOM1            = Bits("b?????????????????000?????0101011")
  def CUSTOM1_RS1        = Bits("b?????????????????010?????0101011")
  def CUSTOM1_RS1_RS2    = Bits("b?????????????????011?????0101011")
  def CUSTOM1_RD         = Bits("b?????????????????100?????0101011")
  def CUSTOM1_RD_RS1     = Bits("b?????????????????110?????0101011")
  def CUSTOM1_RD_RS1_RS2 = Bits("b?????????????????111?????0101011")
  def CUSTOM2            = Bits("b?????????????????000?????1011011")
  def CUSTOM2_RS1        = Bits("b?????????????????010?????1011011")
  def CUSTOM2_RS1_RS2    = Bits("b?????????????????011?????1011011")
  def CUSTOM2_RD         = Bits("b?????????????????100?????1011011")
  def CUSTOM2_RD_RS1     = Bits("b?????????????????110?????1011011")
  def CUSTOM2_RD_RS1_RS2 = Bits("b?????????????????111?????1011011")
  def CUSTOM3            = Bits("b?????????????????000?????1111011")
  def CUSTOM3_RS1        = Bits("b?????????????????010?????1111011")
  def CUSTOM3_RS1_RS2    = Bits("b?????????????????011?????1111011")
  def CUSTOM3_RD         = Bits("b?????????????????100?????1111011")
  def CUSTOM3_RD_RS1     = Bits("b?????????????????110?????1111011")
  def CUSTOM3_RD_RS1_RS2 = Bits("b?????????????????111?????1111011")
}

abstract trait CoreParameters extends UsesParameters {
  val xprLen = 64//params[Int]("XprLen")
  val coreInstBits = 32//params[Int]("CoreInstBits")
  val coreInstBytes = coreInstBits/8
  val coreDataBits = xprLen
  val coreDataBytes = coreDataBits/8
  val coreDCacheReqTagBits = 7 + 2
  val coreMaxAddrBits = 43
}

abstract class CoreBundle extends Bundle with CoreParameters

class PTWResp extends Bundle {
  val error = Bool()
  val ppn = UInt(width = 19)//params[Int]("PPNBits"))
  val perm = Bits(width = 6)//params[Int]("PermBits"))
}

class Status extends Bundle {
  val ip = Bits(width = 8)
  val im = Bits(width = 8)
  val zero = Bits(width = 7)
  val er = Bool()
  val vm = Bool()
  val s64 = Bool()
  val u64 = Bool()
  val ef = Bool()
  val pei = Bool()
  val ei = Bool()
  val ps = Bool()
  val s = Bool()
}

class TLBPTWIO extends Bundle {
  val req = Decoupled(UInt(width = 30))//params[Int]("VPNBits")))
  val resp = Valid(new PTWResp).flip
  val status = new Status().asInput
  val invalidate = Bool(INPUT)
  val sret = Bool(INPUT)
}

trait MemoryOpConstants {
  val MT_SZ = 3
  val MT_X  = Bits("b???")
  val MT_B  = Bits("b000")
  val MT_H  = Bits("b001")
  val MT_W  = Bits("b010")
  val MT_D  = Bits("b011")
  val MT_BU = Bits("b100")
  val MT_HU = Bits("b101")
  val MT_WU = Bits("b110")

  val M_SZ      = 5
  val M_X       = Bits("b?????");
  val M_XRD     = Bits("b00000"); // int load
  val M_XWR     = Bits("b00001"); // int store
}

class HellaCacheReq extends CoreBundle{
  val kill = Bool()
  val typ  = Bits(width = 3)
  val phys = Bool()
  val addr = UInt(width = coreMaxAddrBits)
  val data = Bits(width = coreDataBits)
  val tag  = Bits(width = coreDCacheReqTagBits)
  val cmd  = Bits(width = 5)
}

class HellaCacheResp extends CoreBundle {
  val nack = Bool() // comes 2 cycles after req.fire
  val replay = Bool()
  val typ = Bits(width = 3)
  val has_data = Bool()
  val data = Bits(width = coreDataBits)
  val data_subword = Bits(width = coreDataBits)
  val tag = Bits(width = coreDCacheReqTagBits)
  val cmd  = Bits(width = 4)
  val addr = UInt(width = coreMaxAddrBits)
  val store_data = Bits(width = coreDataBits)
}

class AlignmentExceptions extends Bundle {
  val ld = Bool()
  val st = Bool()
}

class HellaCacheExceptions extends Bundle {
  val ma = new AlignmentExceptions
  val pf = new AlignmentExceptions
}

// interface between D$ and processor/DTLB
class HellaCacheIO extends CoreBundle {
  val req = Decoupled(new HellaCacheReq)
  val resp = Valid(new HellaCacheResp).flip
  val replay_next = Valid(Bits(width = coreDCacheReqTagBits)).flip
  val xcpt = (new HellaCacheExceptions).asInput
  val ptw = new TLBPTWIO().flip
  val ordered = Bool(INPUT)
}

trait HasPhysicalAddress extends Bundle {
  val addr = UInt(width = 32 - 6) // params[Int]("TLAddrBits"))
}

trait HasClientTransactionId extends Bundle {
  val client_xact_id = Bits(width = 1+(1+1))//params[Int]("TLClientXactIdBits"))
}

trait HasMasterTransactionId extends Bundle {
  val master_xact_id = Bits(width = 3)//params[Int]("TLMasterXactIdBits"))
}

trait HasTileLinkData extends Bundle {
  val data = Bits(width = 512)//params[Int]("TLDataBits"))
}

trait SourcedMessage extends Bundle
trait ClientSourcedMessage extends SourcedMessage
trait MasterSourcedMessage extends SourcedMessage

object Acquire 
{
  def apply(a_type: Bits, addr: UInt, client_xact_id: UInt): Acquire = {
    val acq = new Acquire
    acq.a_type := a_type
    acq.addr := addr
    acq.client_xact_id := client_xact_id
    acq.data := Bits(0)
    acq.write_mask := Bits(0)
    acq.subword_addr := Bits(0)
    acq.atomic_opcode := Bits(0)
    acq
  }
  def apply(a_type: Bits, addr: UInt, client_xact_id: UInt, data: UInt): Acquire = {
    val acq = apply(a_type, addr, client_xact_id)
    acq.data := data
    acq
  }
  def apply(a_type: UInt, addr: UInt, client_xact_id: UInt, write_mask: Bits, data: UInt): Acquire = {
    val acq = apply(a_type, addr, client_xact_id, data)
    acq.write_mask := write_mask
    acq
  }
  def apply(a_type: UInt, addr: UInt, client_xact_id: UInt, subword_addr: UInt, atomic_opcode: UInt, data: UInt): Acquire = {
    val acq = apply(a_type, addr, client_xact_id, data)
    acq.subword_addr := subword_addr
    acq.atomic_opcode := atomic_opcode
    acq
  }
  def apply(a: Acquire): Acquire = {
    val acq = new Acquire
    acq := a
    acq
  }
}

class Acquire extends ClientSourcedMessage 
    with HasPhysicalAddress 
    with HasClientTransactionId 
    with HasTileLinkData {
  val a_type = UInt(width = 10) //params[Int]("TLCoherence").acquireTypeWidth)
  val write_mask = Bits(width = 6)//params[Int]("TLWriteMaskBits"))
  val subword_addr = Bits(width = 3)//params[Int]("TLWordAddrBits"))
  val atomic_opcode = Bits(width = 4)//params[Int]("TLAtomicOpBits"))
}

object Release
{
  def apply(r_type: UInt, addr: UInt, data: UInt): Release = {
    val rel = new Release
    rel.r_type := r_type
    rel.addr := addr
    rel.data := data
    rel
  }
  def apply(r_type: UInt, addr: UInt, client_xact_id: UInt, master_xact_id: UInt): Release = {
    val rel = new Release
    rel.r_type := r_type
    rel.addr := addr
    rel.client_xact_id := client_xact_id
    rel.master_xact_id := master_xact_id
    rel.data := UInt(0)
    rel
  }
  def apply(r_type: UInt, addr: UInt, client_xact_id: UInt, master_xact_id: UInt, data: UInt): Release = {
    val rel = apply(r_type, addr, client_xact_id, master_xact_id)
    rel.data := data
    rel
  }
}

class Release extends ClientSourcedMessage 
    with HasPhysicalAddress 
    with HasClientTransactionId 
    with HasMasterTransactionId 
    with HasTileLinkData {
  val r_type = UInt(width = 10)//params[Int]("TLCoherenceBits"))
}

object Grant
{
  def apply(g_type: UInt, client_xact_id: UInt, master_xact_id: UInt): Grant = {
    val gnt = new Grant
    gnt.g_type := g_type
    gnt.client_xact_id := client_xact_id
    gnt.master_xact_id := master_xact_id
    gnt.data := UInt(0)
    gnt
  }
  def apply(g_type: UInt, client_xact_id: UInt, master_xact_id: UInt, data: UInt): Grant = {
    val gnt = apply(g_type, client_xact_id, master_xact_id)
    gnt.data := data
    gnt
  }
}

class Grant extends MasterSourcedMessage 
    with HasTileLinkData 
    with HasClientTransactionId 
    with HasMasterTransactionId {
  val g_type = UInt(width = 5)//params[Int]("TLCoherenceGrantBits"))
}

class Finish extends ClientSourcedMessage with HasMasterTransactionId

class LogicalHeader extends Bundle {
  val src = UInt(width = log2Up(1+1+1))//params[Int]("LNEndpoints")))
  val dst = UInt(width = log2Up(1+1+1))//params[Int]("LNEndpoints")))
}

class LogicalNetworkIO[T <: Data](dType: T) extends Bundle {
  val header = new LogicalHeader
  val payload = dType.clone
  override def clone = { new LogicalNetworkIO(dType).asInstanceOf[this.type] }
}

class UncachedTileLinkIO extends Bundle {
  val acquire   = new DecoupledIO(new LogicalNetworkIO(new Acquire))
  val grant     = new DecoupledIO(new LogicalNetworkIO(new Grant)).flip
  val finish = new DecoupledIO(new LogicalNetworkIO(new Finish))
}

//RoCC
class RoCCInstruction extends Bundle
{
  val funct = Bits(width = 7)
  val rs2 = Bits(width = 5)
  val rs1 = Bits(width = 5)
  val xd = Bool()
  val xs1 = Bool()
  val xs2 = Bool()
  val rd = Bits(width = 5)
  val opcode = Bits(width = 7)
}

class RoCCCommand extends Bundle
{
  val inst = new RoCCInstruction
  val rs1 = Bits(width = 64)
  //val rs1 = Bits(width = params[Int]("XprLen"))
  val rs2 = Bits(width = 64)
  //val rs2 = Bits(width = params[Int]("XprLen"))
}

class RoCCResponse extends Bundle
{
  val rd = Bits(width = 5)
  val data = Bits(width = 64)//params[Int]("XprLen"))
}

class RoCCInterface extends Bundle
{
  val cmd = Decoupled(new RoCCCommand).flip
  val resp = Decoupled(new RoCCResponse)
  val mem = new HellaCacheIO
  val busy = Bool(OUTPUT)
  val s = Bool(INPUT)
  val interrupt = Bool(OUTPUT)
  
  // These should be handled differently, eventually
  val imem = new UncachedTileLinkIO
  val iptw = new TLBPTWIO
  val dptw = new TLBPTWIO
  val pptw = new TLBPTWIO
  val exception = Bool(INPUT)
}
*/

//abstract class RoCC extends Module
//{
  //val io = new RoCCInterface
  //io.mem.req.bits.phys := Bool(true) // don't perform address translation
//}

abstract class SimpleRoCC extends RoCC
{
  io.interrupt := Bool(false)
    // Set this true to trigger an interrupt on the processor (please refer to supervisor documentation)

  //a simple accelerator doesn't use imem or page tables
  io.imem.acquire.valid := Bool(false)
  io.imem.grant.ready := Bool(true)
  io.imem.finish.valid := Bool(false)
  io.iptw.req.valid := Bool(false)
  io.dptw.req.valid := Bool(false)
  io.pptw.req.valid := Bool(false)
}


// These case classes and objects are used to provide convenient scala structures for the Chisel Bundles
case class TestInst(funct: BigInt, rd: BigInt,  rs1: BigInt,  rs2: BigInt,
                                   xd: Boolean, xs1: Boolean, xs2: Boolean,
                    opcode: BigInt=Instructions.CUSTOM0.litValue().toInt) {
  def inject(db: AdvTester[_], target: RoCCInstruction): Unit = {
    db.wire_poke(target.funct, funct)
    db.wire_poke(target.rd, rd)
    db.wire_poke(target.xd, if(xd) 1 else 0)
    db.wire_poke(target.rs1, rs1)
    db.wire_poke(target.xs1, if(xs1) 1 else 0)
    db.wire_poke(target.rs2, rs2)
    db.wire_poke(target.xs2, if(xs2) 1 else 0)
    db.wire_poke(target.opcode, opcode)
  }
}
case class TestCmd(inst: TestInst, rs1: BigInt=0, rs2: BigInt=0) {
def inject(db: AdvTester[_], target: RoCCCommand): Unit = {
    db.wire_poke(target.rs1, rs1)
    db.wire_poke(target.rs2, rs2)
    inst.inject(db, target.inst)
  }
}
// This factory object provides a convenient way to construct instructions
object TestCmd {
  def addr(maddr: Int, haddr: Int) = (
    TestCmd(TestInst(0, 0, 2, 3, false, true, true), maddr, haddr)
  )
  def len(mlen: Int) = (
    TestCmd(TestInst(1, 0, 4, 0, false, true, false), mlen)
  )
}

case class TestResp(rd: BigInt, data: BigInt)
object TestResp {
def extract(db: AdvTester[_], source: RoCCResponse) = ({
    def db_extract(t: Bits) = db.peek(t)
    TestResp(db_extract(source.rd), db_extract(source.data))
  })
}
case class TestMemReq(addr: BigInt, cmd: BigInt, data: BigInt, typ: BigInt, phys: Boolean, tag: BigInt)
object TestMemReq {
def extract(db: AdvTester[_], source: HellaCacheReq) = ({
    def db_extract(t: Bits) = db.peek(t)
    TestMemReq( db_extract(source.addr), db_extract(source.cmd),     db_extract(source.data),
                db_extract(source.typ),  db_extract(source.phys)==1, db_extract(source.tag) )
  })
}
case class TestMemResp(data: BigInt, tag: BigInt, cmd: BigInt) {
def inject(db: AdvTester[_], target: HellaCacheResp): Unit = {
    db.reg_poke(target.data, data)
    db.reg_poke(target.tag, tag)
    db.reg_poke(target.cmd, cmd)
  }
}

class RoCCTest[+T <: Module](dut: RoCC) extends AdvTester(dut) {
  // Setup the IO handlers
  val Cmd_IHandler     = new DecoupledSource(dut.io.cmd, (sckt: RoCCCommand, in: TestCmd) => in.inject(this, sckt))
  val Resp_OHandler    = new DecoupledSink(dut.io.resp, (sckt: RoCCResponse) => TestResp.extract(this, sckt))
  val MemReq_OHandler  = new DecoupledSink(dut.io.mem.req, (sckt: HellaCacheReq) => TestMemReq.extract(this, sckt))
  val MemResp_IHandler = new ValidSource(dut.io.mem.resp, (sckt: HellaCacheResp, in: TestMemResp) => in.inject(this, sckt))

  def dutBusy = peek(dut.io.busy) == 1

/*
  val InterruptChecker = new AdvTester.Processable {
    def process() = { assert(ovars(dut.io.interrupt).litValue() == 0, "System Failure: Accelerator not allowed to raise interrupt.") }
    preprocessors += this
  }
  val ResponseChecker = new AdvTester.Processable {
    def process() = {
      if(!assert(Resp_OHandler.outputs.isEmpty, "System Failure: Accelerator not expected to send a response."))
      {
        Resp_OHandler.outputs.dequeue()
      }
    }
    preprocessors += this
  }
  */

  // Setup some memory models
  val instantMemory = new InstantMemory(64, 64*64*2, MemReq_OHandler.outputs, MemResp_IHandler.inputs)
  val slowMemory = new SlowMemory(64, 64*64*2, MemReq_OHandler.outputs, MemResp_IHandler.inputs)
  val randomMemory = new RandomMemory(64, 64*64*2, MemReq_OHandler.outputs, MemResp_IHandler.inputs)
}

abstract class SimMemory(word_width: Int, depth: Int) extends AdvTester.Processable {//with MemoryOpConstants{
  require(word_width == 64, "MemError: Memory must have 64 bit words (for now)")
  val memory = Array.fill(depth)(BigInt(0))
  var reqs_handled = 0

  val trans_shift = log2Up(word_width)-3 // must shift addr by this much
  val max_addr = depth*(word_width>>3) // exclusive
  def store_addr(addr: Int, data: BigInt): Unit = {memory(addr >> trans_shift) = data}
  def load_addr(addr: Int): BigInt = memory(addr >> trans_shift)
  def check_addr(addr: Int): Boolean = {
    assert( addr >= 0 && (addr < max_addr), "MemError: Address %x out of memory range [0,%x)".format(addr, max_addr) )
    assert( (addr & ((word_width>>3)-1))==0, "MemError: Misaligned address %x".format(addr) )
    true
  }
  
  def store_data(startaddr: Int, newdata: Array[BigInt]) = {
    (0 until newdata.length).foreach(idx => store_addr(startaddr+idx*8, newdata(idx)) )
  }

  def handle_request(req: TestMemReq): TestMemResp = {
    reqs_handled += 1
    check_addr(req.addr.toInt)
    assert( req.typ == MT_D.litValue().toInt, "MemError: only supported type (field: typ) is MT_D" )
    assert( req.phys, "MemError: can only handle physical addresses (field: phys = true)" )

    if(req.cmd == M_XRD.litValue().toInt) {
      TestMemResp(data=load_addr(req.addr.toInt), tag=req.tag, cmd=req.cmd)
    } else if(req.cmd == M_XWR.litValue().toInt) {
      store_addr(req.addr.toInt, req.data)
      TestMemResp(data=BigInt(0),                 tag=req.tag, cmd=req.cmd)
    } else {
      assert(false, "MemError: Invalid Command: Only supported cmds are M_XRD, M_XWR.")
      null
    }
  }
}

class InstantMemory(word_width: Int, depth: Int, req_q: scala.collection.mutable.Queue[TestMemReq], resp_q: scala.collection.mutable.Queue[TestMemResp]) extends SimMemory(word_width, depth) {
  def process() = {
    if(!req_q.isEmpty) {
      resp_q.enqueue(handle_request(req_q.dequeue()))
    }
  }
}

class SlowMemory(word_width: Int, depth: Int, req_q: scala.collection.mutable.Queue[TestMemReq], resp_q: scala.collection.mutable.Queue[TestMemResp]) extends SimMemory(word_width, depth) {
  val max_wait = 4
  val schedule = Array.fill(max_wait)(new scala.collection.mutable.Queue[TestMemResp])
  var cur_time = 0

  def process() = {
    if(!req_q.isEmpty) {
      schedule((cur_time+max_wait-1) % max_wait).enqueue(handle_request(req_q.dequeue()))
    }

    while(!schedule(cur_time).isEmpty) { resp_q.enqueue(schedule(cur_time).dequeue()) }

    cur_time = (cur_time + 1) % max_wait
  }
}

class RandomMemory(word_width: Int, depth: Int, req_q: scala.collection.mutable.Queue[TestMemReq], resp_q: scala.collection.mutable.Queue[TestMemResp]) extends SimMemory(word_width, depth) {
  val rand = new Random(1)
  def check_prob(prob: Int) : Boolean = (math.abs(rand.nextInt()) % 100) <= prob
  def random_range(start: Int, end: Int) : Int = (math.abs(rand.nextInt()) % (end-start)) + start // include start, not end

  val max_wait = 8
  val schedule = Array.fill(max_wait)(new scala.collection.mutable.Queue[TestMemResp])
  var cur_time = 0

  def process() = {
    if(!req_q.isEmpty && check_prob(66)) {
      schedule(random_range(0, max_wait)).enqueue(handle_request(req_q.dequeue()))
    }

    while(!schedule(cur_time).isEmpty) { resp_q.enqueue(schedule(cur_time).dequeue()) }

    cur_time = (cur_time + 1) % max_wait
  }
}
