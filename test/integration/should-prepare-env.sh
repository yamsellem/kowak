#!/usr/bin/env bash

set -ue -o pipefail

echo "++++++++++++++++++++++++++++++++++++++++++"
echo "+ $( basename "${BASH_SOURCE[0]}" )"
echo "++++++++++++++++++++++++++++++++++++++++++"

create_vagrant_virtual_machine 

bash ${BIN_DIR}/setup-env.sh

assert_eq "$(execute_on_virtual_machine 'command -v git')" \
                "/usr/bin/git" \
                "git is not installed"

assert_eq "$(execute_on_virtual_machine 'command -v node')" \
            "/usr/bin/node" \
            "node is not installed"

assert_eq "$(execute_on_virtual_machine 'command -v npm')" \
            "/usr/bin/npm" \
            "npm is not installed"

assert_eq "$(execute_on_virtual_machine 'command -v pm2')" \
            "/usr/bin/pm2" \
            "pm2 is not installed"
