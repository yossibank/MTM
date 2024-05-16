PRODUCT_NAME := MTM

.PHONY: setup
setup:
	$(MAKE) install-pre-commit
	$(MAKE) install-bundler
	$(MAKE) install-mint-packages
	$(MAKE) generate-folder
	$(MAKE) generate-mock
	$(MAKE) open

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

.PHONY: generate-folder
generate-folder:
	mkdir -p Package/Sources/Mock/Generated

.PHONY: generate-mock
generate-mock:
	sh Script/mockolo.sh

.PHONY: open
open:
	open ./$(PRODUCT_NAME).xcworkspace

.PHONY: clean
clean:
	find . -type d \( -name \*.xcodeproj \) | xargs rm -rf
	rm -rf $${HOME}/Library/Developer/Xcode/DerivedData
