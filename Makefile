PRODUCT_NAME := MMM

.PHONY: setup
setup:
	$(MAKE) setup-pre-commit
	$(MAKE) install-pre-commit

.PHONY: setup-pre-commit
setup-pre-commit:
	brew install pre-commit

.PHONY: install-pre-commit
install-pre-commit:
	pre-commit install