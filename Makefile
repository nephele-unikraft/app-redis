UK_ROOT ?= $(PWD)/../../unikraft
UK_LIBS ?= $(PWD)/../../libs
LIBS := $(UK_LIBS)/pthread-embedded:$(UK_LIBS)/newlib:$(UK_LIBS)/lwip:$(UK_LIBS)/redis:$(UK_LIBS)/tinyalloc:$(UK_LIBS)/mimalloc

.config: config/config-unikraft-build
	cp $^ $@

all: .config
	@+$(MAKE) -C $(UK_ROOT) A=$(PWD) L=$(LIBS)

$(MAKECMDGOALS):
	@+$(MAKE) -C $(UK_ROOT) A=$(PWD) L=$(LIBS) $(MAKECMDGOALS)
