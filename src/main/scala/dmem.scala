//see LICENSE for license
//authors: Albert Ou
package sha3

import Chisel._
import freechips.rocketchip.config.{Field, Parameters}
import freechips.rocketchip.tile.HasCoreParameters
import freechips.rocketchip.rocket.{HellaCacheReq, TLB, TLBPTWIO, TLBConfig, MStatus}
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._

case object Sha3TLB extends Field[Option[TLBConfig]](None)

class DmemModule(implicit p: Parameters) extends LazyModule {
  lazy val module = new DmemModuleImp(this)
  // FIXME: Unused Diplomacy node needed for conveying the physical address map to the TLB
  val node = TLClientNode(Seq(TLClientPortParameters(Seq(TLClientParameters("SHA3")))))
}

class DmemModuleImp(outer: DmemModule)(implicit p: Parameters) extends LazyModuleImp(outer)
  with HasCoreParameters {

  val io = IO(new Bundle {
    val req = Decoupled(new HellaCacheReq).flip
    val mem = Decoupled(new HellaCacheReq)
    val ptw = new TLBPTWIO
    val status = Valid(new MStatus).flip
  })

  val (tl, edge) = outer.node.out.head
  // Tie off unused channels
  tl.a.valid := Bool(false)
  tl.b.ready := Bool(true)
  tl.c.valid := Bool(false)
  tl.d.ready := Bool(true)
  tl.e.valid := Bool(false)

  val status = Reg(new MStatus)
  when (io.status.valid) {
    status := io.status.bits
  }

  val s_tlb :: s_mem :: s_xcpt :: Nil = Enum(UInt(), 3)
  val state = Reg(init = s_tlb)

  val tlb = Module(new TLB(false, log2Ceil(coreDataBytes), p(Sha3TLB).get)(edge, p))
  tlb.io.req.valid := Bool(false)
  tlb.io.req.bits.vaddr := io.req.bits.addr
  tlb.io.req.bits.size := io.req.bits.size
  tlb.io.req.bits.cmd := io.req.bits.cmd
  tlb.io.req.bits.passthrough := Bool(false)

  io.ptw <> tlb.io.ptw
  tlb.io.ptw.status := status
  tlb.io.sfence.valid := Bool(false) // FIXME

  io.req.ready := Bool(false)

  io.mem.valid := Bool(false)
  io.mem.bits := io.req.bits
  io.mem.bits.addr := tlb.io.resp.paddr
  io.mem.bits.signed := Bool(false)
  io.mem.bits.phys := Bool(true)

  val xcpt = Seq(tlb.io.resp.pf, tlb.io.resp.ae, tlb.io.resp.ma).
    map(x => x.ld || x.st).reduce(_ || _)

  switch (state) {
    is (s_tlb) {
      tlb.io.req.valid := io.req.valid
      when (tlb.io.req.fire()) {
        when (tlb.io.resp.miss || xcpt) {
          state := s_xcpt
        } .otherwise {
          state := s_mem
        }
      }
    }
    is (s_mem) {
      io.mem.valid := Bool(true)
      io.req.ready := io.mem.ready
      when (io.mem.ready) {
        state := s_tlb
      }
    }
  }
}
