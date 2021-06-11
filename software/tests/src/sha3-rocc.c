//see LICENSE for license
// The following is a RISC-V program to test the functionality of the
// sha3 RoCC accelerator.
// Compile with riscv-gcc sha3-rocc.c
// Run with spike --extension=sha3 pk a.out

#include <stdio.h>
#include <stdint.h>
#include "rocc.h"
#include "sha3.h"
#include "encoding.h"
#include "compiler.h"

#ifdef __linux
#include <sys/mman.h>
#endif

int main() {

  unsigned long start, end;

#ifdef __linux
  // Ensure all pages are resident to avoid accelerator page faults
  if (mlockall(MCL_CURRENT | MCL_FUTURE)) {
    perror("mlockall");
    return 1;
  }
#endif

  do {
    printf("Start basic test 1.\n");
    // BASIC TEST 1 - 150 zero bytes

    // Setup some test data
    static unsigned char input[150] __aligned(8) = { '\0' };
    unsigned char output[SHA3_256_DIGEST_SIZE] __aligned(8);

    start = rdcycle();

    // Compute hash with accelerator
    asm volatile ("fence");
    // Invoke the acclerator and check responses

    // setup accelerator with addresses of input and output
    //              opcode rd rs1          rs2          funct
    /* asm volatile ("custom2 x0, %[msg_addr], %[hash_addr], 0" : : [msg_addr]"r"(&input), [hash_addr]"r"(&output)); */
    ROCC_INSTRUCTION_SS(2, &input, &output, 0);

    // Set length and compute hash
    //              opcode rd rs1      rs2 funct
    /* asm volatile ("custom2 x0, %[length], x0, 1" : : [length]"r"(ilen)); */
    ROCC_INSTRUCTION_S(2, sizeof(input), 1);
    asm volatile ("fence" ::: "memory");

    end = rdcycle();

    // Check result
    int i;
    static const unsigned char result[SHA3_256_DIGEST_SIZE] =
#ifdef KECCAK
    {221,204,157,217,67,211,86,31,54,168,44,245,97,194,193,26,234,42,135,166,66,134,39,174,184,61,3,149,137,42,57,238};
#else /* FIPS 202 */
    {203,52,27,85,46,79,152,228,86,138,201,206,253,168,255,107,122,177,65,68,231,19,70,198,64,90,192,80,206,234,168,159};
#endif
    //sha3ONE(input, sizeof(input), result);
    for(i = 0; i < SHA3_256_DIGEST_SIZE; i++){
      printf("output[%d]:%d ==? results[%d]:%d \n",i,output[i],i,result[i]);
      if(output[i] != result[i]) {
        printf("Failed: Outputs don't match!\n");
        printf("SHA execution took %lu cycles\n", end - start);
        return 1;
      }
    }
  } while(0);

  printf("Success!\n");

  printf("SHA execution took %lu cycles\n", end - start);

  return 0;
}
