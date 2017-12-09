#
# Variables
#

PROJECT_NAME=ProjectTemplate

#
# Main Targets
#

.PHONY: all
all: setup_tools install_dependency

.PHONY: update_tools
update_tools:
	bundle update

.PHONY: setup_tools
setup_tools: setup_provision provision
	bundle install --path vendor/bundle

.PHONY: install_dependency
install_dependency:
	bundle exec pod install

.PHONY: update_dependency
update_dependency:
	bundle exec pod update

.PHONY: synx
synx:
	bundle exec synx $(PROJECT_NAME).xcodeproj

.PHONY: format
format:
	swimat -r $(shell ls -1 | grep -i "$(PROJECT_NAME)" | grep -v .xc)

#
# Install tools
#

SCRIPT_DIR=$$(pwd)/scripts
.PHONY: setup_provision
setup_provision: check.xcode
	@$(SCRIPT_DIR)/InstallAnsible.sh
	@$(SCRIPT_DIR)/UpdateAnsible.sh

.PHONY: provision
provision: check.xcode
	@$(SCRIPT_DIR)/PlayAnsible.sh
	@$(SCRIPT_DIR)/NotifyFinished.sh

.PHONY: check.xcode
check.xcode:
	@$(SCRIPT_DIR)/CheckXcode.sh
