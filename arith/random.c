#include <stdio.h>
#include <stdint.h> // for intptr_t
#include <stdlib.h>
#include <gmp.h>
#include "pbc_random.h"
#include "pbc_utils.h"
#include "pbc_memory.h"
#include <tee_internal_api.h>

void pbc_mpz_random(mpz_t r, mpz_t limit) {
  int n, bytecount, leftover;
  unsigned char *bytes;
  mpz_t z;
  mpz_init(z);
  n = mpz_sizeinbase(limit, 2);
  bytecount = (n + 7) / 8;
  leftover = n % 8;
  bytes = (unsigned char *) pbc_malloc(bytecount);
  for (;;) {
    TEE_GenerateRandom(bytes, bytecount);
    if (leftover) {
      *bytes = *bytes % (1 << leftover);
    }
    mpz_import(z, bytecount, 1, 1, 0, 0, bytes);
    if (mpz_cmp(z, limit) < 0) break;
  }
  mpz_set(r, z);
  mpz_clear(z);
  pbc_free(bytes);
}

void pbc_mpz_randomb(mpz_t z, unsigned int bits) {
  mpz_t limit;
  mpz_init(limit);
  mpz_setbit(limit, bits);
  pbc_mpz_random(z, limit);
  mpz_clear(limit);
}