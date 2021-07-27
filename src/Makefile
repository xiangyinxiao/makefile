include $(TOPDIR)/tools/Config.mk #提供的基本的封装
include $(TOPDIR)/tools/libs.mk   #库路径
include $(TOPDIR)/tools/dirs.mk	  #编译目录



LIBSPATHS =-L$(TOPDIR)/src/staging  #获取库路径

VPATH +=include

export VPATH

CFLAGS += $(patsubst %,-I%,$(subst :, ,$(VPATH))) #获取头文件路径

LDLIBS=$(patsubst %.a,%,$(patsubst staging/lib%,-l%,$(TESTLIBS))) #获取要链接的库

all:staging pass1 $(BIN) 
	@echo hello world

$(BIN): 
	@echo $(VPATH)
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
