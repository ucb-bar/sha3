//see LICENSE for license
//authors: Colin Schmidt, Adam Izraelevitz
package sha3

import Chisel._
import freechips.rocketchip.tile._
import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.rocket.{TLBConfig, HellaCacheReq}

case object Sha3WidthP extends Field[Int]
case object Sha3Stages extends Field[Int]
case object Sha3FastMem extends Field[Boolean]
case object Sha3BufferSram extends Field[Boolean]
/*
 * Implement original Keccak candidate instead of the finalized FIPS 202
 * specification, which differs in the padding behavior
 */
case object Sha3Keccak extends Field[Boolean]
/*
 * Enable specific printf's. This is used to demonstrate MIDAS
 * printf's during the MICRO2019 tutorial.
 */
case object Sha3PrintfEnable extends Field[Boolean](false)

/*
abstract class SimpleRoCC()(implicit p: Parameters) extends RoCC()(p)
{
  io.interrupt := Bool(false)
    // Set this true to trigger an interrupt on the processor (please refer to supervisor documentation)

  //a simple accelerator doesn't use imem or page tables

  //Old Format
  //io.imem.acquire.valid := Bool(false)
  //io.imem.grant.ready := Bool(false)
  //io.imem.finish.valid := Bool(false)
  //io.iptw.req.valid := Bool(false)
  //io.dptw.req.valid := Bool(false)
  //io.pptw.req.valid := Bool(false)

  //New Format
  io.autl.acquire.valid := Bool(false)
  io.autl.grant.ready := Bool(false)
  for(i <- 0 until p(RoccNPTWPorts)) io.ptw(i).req.valid := Bool(false)
}
*/

class Sha3Accel(opcodes: OpcodeSet)(implicit p: Parameters) extends LazyRoCC(
    opcodes = opcodes, nPTWPorts = if (p(Sha3TLB).isDefined) 1 else 0) {
  override lazy val module = new Sha3AccelImp(this)
  val dmemOpt = p(Sha3TLB).map { _ =>
    val dmem = LazyModule(new DmemModule)
    tlNode := dmem.node
    dmem
  }
}

class Sha3AccelImp(outer: Sha3Accel)(implicit p: Parameters) extends LazyRoCCModuleImp(outer) {
  //parameters
  val W = p(Sha3WidthP)
  val S = p(Sha3Stages)
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

  val ctrl = Module(new CtrlModule(W,S)(p))

  ctrl.io.rocc_req_val   <> io.cmd.valid
  io.cmd.ready := ctrl.io.rocc_req_rdy
  ctrl.io.rocc_funct     <> io.cmd.bits.inst.funct
  ctrl.io.rocc_rs1       <> io.cmd.bits.rs1
  ctrl.io.rocc_rs2       <> io.cmd.bits.rs2
  ctrl.io.rocc_rd        <> io.cmd.bits.inst.rd
  io.busy := ctrl.io.busy

  val dmem_data = Wire(Bits())
  private def dmem_ctrl(req: DecoupledIO[HellaCacheReq]) {
    req.valid := ctrl.io.dmem_req_val
    ctrl.io.dmem_req_rdy := req.ready
    req.bits.tag := ctrl.io.dmem_req_tag
    req.bits.addr := ctrl.io.dmem_req_addr
    req.bits.cmd := ctrl.io.dmem_req_cmd
    req.bits.size := ctrl.io.dmem_req_size
    req.bits.data := dmem_data
    req.bits.signed := Bool(false)
    req.bits.phys := Bool(false)
  }

  outer.dmemOpt match {
    case Some(m) => {
      val dmem = m.module
      dmem_ctrl(dmem.io.req)
      io.mem.req <> dmem.io.mem
      io.ptw.head <> dmem.io.ptw

      dmem.io.status.valid := io.cmd.fire()
      dmem.io.status.bits := io.cmd.bits.status
      dmem.io.sfence := ctrl.io.sfence
    }
    case None => dmem_ctrl(io.mem.req)
  }

  ctrl.io.dmem_resp_val  <> io.mem.resp.valid
  ctrl.io.dmem_resp_tag  <> io.mem.resp.bits.tag
  ctrl.io.dmem_resp_data := io.mem.resp.bits.data

  val dpath = Module(new DpathModule(W,S)(p))

  dpath.io.message_in <> ctrl.io.buffer_out
  dmem_data := dpath.io.hash_out(ctrl.io.windex)

  //ctrl.io <> dpath.io
  dpath.io.absorb := ctrl.io.absorb
  dpath.io.init := ctrl.io.init
  dpath.io.write := ctrl.io.write
  dpath.io.round := ctrl.io.round
  dpath.io.stage := ctrl.io.stage
  dpath.io.aindex := ctrl.io.aindex

}

class WithSha3Accel extends Config ((site, here, up) => {
  case Sha3WidthP => 64
  case Sha3Stages => 1
  case Sha3FastMem => true
  case Sha3BufferSram => false
  case Sha3Keccak => false
  case Sha3TLB => Some(TLBConfig(nEntries = 4, nSectors = 1, nSuperpageEntries = 1))
  case BuildRoCC => Seq(
    (p: Parameters) => {
      val sha3 = LazyModule.apply(new Sha3Accel(OpcodeSet.custom2)(p))
      sha3
    }
  )
})

class WithSha3Printf extends Config((site, here, up) => {
  case Sha3PrintfEnable => true
})
