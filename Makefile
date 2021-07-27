

ifeq ($(wildcard .config),)
.DEFAULT default:
	@echo "test has not been configured!"
else
include .config
TOPDIR := ${shell echo $(CURDIR) | sed -e 's/ /\\ /g'}
export TOPDIR

endif

include tools/Config.mk

menuconfig:
	kconfig-mconf Kconfig

BIN=test

export BIN

all: $(BIN) 

.PHONY: clean

$(BIN):
	$(Q) echo "compile test"
	$(Q) $(MAKE) -C src 

clean:
	$(Q) echo "clean test"
	$(Q) $(MAKE) -C src  clean
	$(Q) rm -rf $(BIN)
	$(Q) rm -rf src/staging

.PHONY: clean 
