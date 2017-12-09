#!/bin/bash

. $(dirname ${BASH_SOURCE:-$0})/Context.sh
print_context
tag_echo $(basename $0) "Doing common playbook"

PROJECT_NAME=$(ls -1 . | grep .xcodeproj | head -n1 | sed -e "s/\..*$//g")
EXTRA_VARS="{\"PROJECT_NAME\": \"${PROJECT_NAME}\"}"

cd ${PROVISIONING_HOME}/provisioning > /dev/null 2>&1
ansible-playbook site.yml --connection=local --extra-vars "${EXTRA_VARS}"
