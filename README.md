# optee_pbc
This repository holds a port of the [PBC](https://crypto.stanford.edu/pbc/) library to [OP-TEE](https://www.op-tee.org).

This port provides support for type A pairings only.

## Disclaimer
This library was ported for prototyping **only**. It was not extensively tested and it can not be considered secure.
Do **not** use it as part of a production setup.

## Dependencies

The PBC library is built on the [GMP](https://gmplib.org) library.

A port of the GMP library to OP-TEE can be found in the following repository:
https://github.com/vascoguita/optee_gmp

You should install the GMP library before building the PBC library.
The instructions to do so are available in the above repository.

## Installation instructions
    # 'cross_compile' and 'ta_dev_kit_dir' should be the same that were used to install the GMP library
    make CROSS_COMPILE=<cross_compile> PLATFORM=<platform> TA_DEV_KIT_DIR=<ta_dev_kit_dir>
    make install TA_DEV_KIT_DIR=<ta_dev_kit_dir>