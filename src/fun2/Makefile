include $(TOPDIR)/tools/Config.mk

VPATH +=:fun2-1
fun2_CSRCS +=add.c

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
