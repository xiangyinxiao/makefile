
ifneq ($(wildcard .config),)
.DEFAULT default:
	@echo "test has not been configured!"
	@echo "To configure the project:"
	@echo "  tools/configure.sh <config>"
	@echo "For a list of available configurations:"
	@echo "  tools/configure.sh -L"
else
-include .config
TOPDIR := ${shell echo $(CURDIR) | sed -e 's/ /\\ /g'}
export TOPDIR

endif

include $(TOPDIR)/tools/Config.mk

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
	rm -rf src/staging

.PHONY: clean 
