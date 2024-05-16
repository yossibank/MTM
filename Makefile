PRODUCT_NAME := MMM

.PHONY: setup
setup:
	$(MAKE) install-pre-commit
	$(MAKE) install-bundler
	$(MAKE) install-mint-packages

.PHONY: setup-pre-commit
setup-pre-commit:
	brew install pre-commit

.PHONY: install-pre-commit
install-pre-commit:
	pre-commit install

.PHONY: install-bundler
install-bundler:
	bundle install

.PHONY: install-mint-packages
install-mint-packages:
	mint bootstrap --overwrite y

.PHONY: clean
clean:
	find . -type d \( -name \*.xcodeproj \) | xargs rm -rf
	rm -rf $${HOME}/Library/Developer/Xcode/DerivedData
