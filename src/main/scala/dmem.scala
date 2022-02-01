//see LICENSE for license
//authors: Albert Ou
package sha3

import Chisel._
import freechips.rocketchip.config.{Field, Parameters}
import freechips.rocketchip.tile.HasCoreParameters
import freechips.rocketchip.rocket.{HellaCacheReq, TLB, TLBPTWIO, TLBConfig, MStatus, PRV}
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._

case object Sha3TLB extends Field[Option[TLBConfig]](None)

class DmemModule(implicit p: Parameters) extends LazyModule {
  lazy val module = new DmemModuleImp(this)
  // FIXME: Unused Diplomacy node needed for conveying the physical address map to the TLB
  val node = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLMasterParameters.v1("SHA3")))))
}

class DmemModuleImp(outer: DmemModule)(implicit p: Parameters) extends LazyModuleImp(outer)
  with HasCoreParameters {

  val io = IO(new Bundle {
    val req = Decoupled(new HellaCacheReq).flip
    val mem = Decoupled(new HellaCacheReq)
    val ptw = new TLBPTWIO
    val status = new MStatus().asInput
    val sfence = Bool(INPUT)
  })

  val (tl, edge) = outer.node.out.head
  // Tie off unused channels
  tl.a.valid := Bool(false)
  tl.b.ready := Bool(true)
  tl.c.valid := Bool(false)
  tl.d.ready := Bool(true)
  tl.e.valid := Bool(false)

  val tlb = Module(new TLB(false, log2Ceil(coreDataBytes), p(Sha3TLB).get)(edge, p))
  tlb.io.req.valid := io.req.valid
  tlb.io.req.bits.vaddr := io.req.bits.addr
  tlb.io.req.bits.size := io.req.bits.size
  tlb.io.req.bits.cmd := io.req.bits.cmd
  tlb.io.req.bits.prv := io.req.bits.dprv
  tlb.io.req.bits.v := io.req.bits.dv
  tlb.io.req.bits.passthrough := Bool(false)
  val tlb_ready = tlb.io.req.ready && !tlb.io.resp.miss

  io.ptw <> tlb.io.ptw
  tlb.io.ptw.status := io.status
  tlb.io.sfence.valid := io.sfence
  tlb.io.sfence.bits.rs1 := Bool(false)
  tlb.io.sfence.bits.rs2 := Bool(false)
  tlb.io.sfence.bits.addr := UInt(0)
  tlb.io.sfence.bits.asid := UInt(0)
  tlb.io.kill := Bool(false)

  io.req.ready := io.mem.ready && tlb_ready

  io.mem.valid := io.req.valid && tlb_ready
  io.mem.bits := io.req.bits
  io.mem.bits.addr := tlb.io.resp.paddr
  /*
   * FIXME: Asserting phys sets io.req.bits.passthrough to true in the
   * DCache TLB, which causes it to assume that the request originates
   * from the PTW and treat it as a supervisor access.  This may lead to
   * spurious PMP exceptions (io.resp.ae.ld) even when the actual
   * privilege level is M-mode.
   */
  io.mem.bits.phys := (io.req.bits.dprv =/= UInt(PRV.M))

  // FIXME: Check TLB exceptions
}
