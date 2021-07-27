include $(TOPDIR)/tools/Config.mk
include  $(TOPDIR)/.config 


VPATH +=:fun2-1
ifeq ($(CONFIG_TEST_FUN2),y)
fun2_CSRCS +=add.c
else
fun2_CSRC +=
endif

CSRCS = $(fun2_CSRCS)
COBJS = $(CSRCS:.c=$(OBJEXT))

SRCS =  $(CSRCS)
OBJS =  $(COBJS)

BIN = libadd$(LIBEXT)
all: $(BIN)

$(COBJS): %$(OBJEXT): %.c
	$(call COMPILE, $<, $@)

$(BIN): $(OBJS) 
	$(call ARCHIVE, $@, $(OBJS))
	$(Q) cp $(BIN) -r $(TOPDIR)/src/staging
	
clean:
	$(call DELFILE, $(BIN))
	$(call CLEAN)
