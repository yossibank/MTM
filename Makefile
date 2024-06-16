PRODUCT_NAME := MTM

.PHONY: setup
setup:
	$(MAKE) install-bundler
	$(MAKE) install-mint-packages
	$(MAKE) install-template
	$(MAKE) generate-folder
	$(MAKE) generate-mock
	$(MAKE) open

.PHONY: pre-commit
pre-commit:
	$(MAKE) setup-pre-commit
	$(MAKE) install-pre-commit

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

.PHONY: install-template
install-template:
	sh Script/template.sh

.PHONY: generate-folder
generate-folder:
	mkdir -p Package/Sources/Mock/Generated

.PHONY: generate-mock
generate-mock:
	sh Script/mockolo.sh

.PHONY: run-format
run-format:
	swift run --package-path BuildTools swiftformat .

.PHONY: update-package
update-package:
	sh Script/update-package.sh

.PHONY: open
open:
	open ./$(PRODUCT_NAME).xcworkspace

.PHONY: clean
clean:
	find . -type d \( -name \*.xcodeproj \) | xargs rm -rf
	rm -rf $${HOME}/Library/Developer/Xcode/DerivedData
