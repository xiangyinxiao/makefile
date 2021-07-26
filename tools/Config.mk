#tools/Config.mk

.SUFFIXES:

# 控制打印信息
ifeq ($(V),1)
export Q :=
else ifeq ($(V),2)
export Q :=
else
export Q :=@
endif


#设备默认的后缀

ASMEXT ?= .S
OBJEXT ?= .o
LIBEXT ?= .a


#设置编译器
CC :=gcc
AR :=ar
LD :=ld

#CC :=arm-none-eabi-gcc
#AR :=arm-none-eabi-ar
#LD :=arm-none-eabi-ld

MAKE :=make 

#定义宏函数

DELIM ?= $(strip /)

define COMPILE
	@echo "CC: $1"
	$(Q) $(CC) -c $(CFLAGS) $($(strip $1)_CFLAGS) $1 -o $2
endef


define ASSEMBLE
	@echo "AS: $1"
	$(Q) $(CC) -c $(AFLAGS) $1 $($(strip $1)_AFLAGS) -o $2
endef

define INSTALL_LIB
	@echo "IN: $1 -> $2"
	$(Q) install -m 0644 $1 $2
endef

define ARCHIVE
	@echo "AR (create): ${shell basename $(1)} $(2)"
	$(Q) $(RM) $1
	$(Q) $(AR) rv $1 $(2)
endef

define DELFILE
	$(Q) rm -f $1
endef

define CATFILE
	$(Q) if [ -z "$(strip $(2))" ]; then echo '' > $(1); else cat $(2) > $1; fi
endef

define CLEAN
	$(Q) rm -f *$(OBJEXT) *$(LIBEXT) *~ .*.swp $(OBJS) $(BIN)
endef
