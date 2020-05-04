SHELL += -eu

BLUE  := \033[0;34m
GREEN := \033[0;32m
RED   := \033[0;31m
NC    := \033[0m

.PHONY: all
all:
	$(MAKE) update
	$(MAKE) test

.PHONY: update
update:
	garden update-remote all

.PHONY: test
test:
	garden test

