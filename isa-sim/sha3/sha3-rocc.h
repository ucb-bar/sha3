#ifndef _RISCV_SHA3_ROCC_H
#define _RISCV_SHA3_ROCC_H

#include "rocc.h"
#include "mmu.h"

class sha3_rocc_t : public rocc_t
{
 public:
  const char* name() { return "sha3"; }

  reg_t custom0(rocc_insn_t insn, reg_t xs1, reg_t xs2)
  {
    switch (insn.funct)
    {
      case 0: // setup: msg_addr <- xs1; hash_addr <- xs2
        msg_addr = xs1;
        hash_addr = xs2;
        return 1;
        break;
      case 1: // get message length from xs1 and compute hash
      {
        msg_len = xs1;
        //TODO: need to translate the sha3 implementation into spike like code
        // This involves using p->get_mmu()->load_uint64(addr) instead of reading
        // and the related ...->store_uint64(hash_addr, hash)
        //sha3ONE(msg_addr, msg_len, hash_addr);
        return 1;
        break;
      }
      default:
        illegal_instruction();
    }

    return 0;
  }

  void reset()
  {
    msg_addr = 0;
    hash_addr = 0;
    msg_len = 0;
  }

 private:
  reg_t msg_addr;
  reg_t hash_addr;
  reg_t msg_len;
};

#endif
