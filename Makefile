SHELL += -eu

BLUE  := \033[0;34m
GREEN := \033[0;32m
RED   := \033[0;31m
NC    := \033[0m

ALPACA_DIR ?= $(shell dirname $(shell pwd))

SERVICES := api-account api-hermes api-mfa api-password

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

.PHONY: link
link:
	@for service in ${SERVICES} ; do \
	  echo "${BLUE}✓ Linking $$service!${NC}\n" ; \
	  garden link module $$service-image $(ALPACA_DIR)/$$service ; \
	  echo "${GREEN}✓ Linked $$service!${NC}\n" ; \
	done

.PHONY: clone
clone:
	@for service in ${SERVICES} ; do \
	  echo "${BLUE}✓ Cloning $$service!${NC}\n" ; \
	  @git clone git@github.com:AlpacaLabs/$$service.git $(ALPACA_DIR) || true ; \
	  echo "${GREEN}✓ Cloned $$service!${NC}\n" ; \
	done
