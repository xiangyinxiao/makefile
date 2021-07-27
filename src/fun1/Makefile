
include $(TOPDIR)/tools/Config.mk
include  $(TOPDIR)/.config 

ifeq ($(CONFIG_TEST_FUN1),y)
fun1_CSRCS +=sub.c
else
fun1_CSRCS +=
endif

ASRCS = $(fun1_ASRCS)
AOBJS = $(ASRCS:.S=$(OBJEXT))

CSRCS = $(fun1_CSRCS)
COBJS = $(CSRCS:.c=$(OBJEXT))

SRCS = $(ASRCS) $(CSRCS)
OBJS = $(AOBJS) $(COBJS)

BIN = libsub$(LIBEXT)

all:$(BIN) $(COBJS)

.PHONY: clean 

$(AOBJS): %$(OBJEXT): %.S
	$(call ASSEMBLE, $<, $@)

$(COBJS): %$(OBJEXT): %.c
	$(call COMPILE, $<, $@)

$(BIN): $(OBJS)
	@echo $(BIN)
	$(call ARCHIVE, $@, $(OBJS))
	$(Q) cp $(BIN) -r $(TOPDIR)/src/staging
clean:
	$(call DELFILE, $(BIN))
	$(call CLEAN)
