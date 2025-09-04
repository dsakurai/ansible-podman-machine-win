#!/usr/bin/env bash
set -e

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"

sudo apt update
sudo apt install -y ansible

# Run the Ansible playbook
ansible-playbook -i inventory.ini ansible.yml
