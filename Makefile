ROOT			?= $(CURDIR)
PBC_ROOT		?= $(ROOT)/lib

.PHONY: all
all: build

.PHONY: build
build:
	$(MAKE) -C $(PBC_ROOT) \
		CROSS_COMPILE=$(CROSS_COMPILE) \
		PLATFORM=$(PLATFORM) \
		TA_DEV_KIT_DIR=$(TA_DEV_KIT_DIR)

.PHONY: install
install:
	cp $(PBC_ROOT)/pbc.a $(TA_DEV_KIT_DIR)/lib/. && \
	mkdir -p $(TA_DEV_KIT_DIR)/include/pbc && \
	cp $(PBC_ROOT)/include/* $(TA_DEV_KIT_DIR)/include/pbc/.

.PHONY: clean
clean:
	$(MAKE) -C $(PBC_ROOT) clean \
		TA_DEV_KIT_DIR=$(TA_DEV_KIT_DIR)

.PHONY: uninstall
uninstall:
	rm -r $(TA_DEV_KIT_DIR)/include/pbc; \
	rm $(TA_DEV_KIT_DIR)/lib/pbc.a;