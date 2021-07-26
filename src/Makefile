include $(TOPDIR)/tools/Config.mk
include $(TOPDIR)/tools/libs.mk
include $(TOPDIR)/tools/dirs.mk

tes_CSRCS +=main.c

LIBSPATHS =-L$(TOPDIR)/src/staging

VPATH +=include

CFLAGS += $(patsubst %,-I%,$(subst :, ,$(VPATH)))

LDLIBS=$(patsubst %.a,%,$(patsubst staging/lib%,-l%,$(TESTLIBS)))

all:staging pass1 $(BIN) 
	@echo hello world

$(BIN): 
	@echo $(LDLIBS)
	$(CC) main.c $(CFLAGS) $(LIBSPATHS) -o ../$(BIN) $(LDLIBS) 

staging: 
	mkdir $(TOPDIR)/src/staging

pass1: 
	$(Q) for dir in $(subdir); do \
		$(MAKE) -C $$dir ||exit;\
	done

clean:
	$(Q) for dir in $(subdir); do \
		$(MAKE) -C $$dir clean ||exit;\
	done

.PHONY: clean 
