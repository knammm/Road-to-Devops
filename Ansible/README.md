# Ansible

## Overview

Ansible is a powerful automation tool used for various purposes such as automation, change management, provisioning, and orchestration. It stands out for its simplicity, as it does not require agents, databases, complex setups, or residual software on target machines.

## Key Features

- **Agentless:** Target machines and services are accessed using SSH, WinRM, and API.
- **No Database:** Configuration data is stored in YAML, INI, and text files.
- **Simple Setup:** Ansible is implemented as a Python library.
- **Idempotent:** Ansible ensures that the desired state is achieved without unnecessary changes.

## Usage

### Ad-hoc Commands

Execute single commands on the command line:

```bash
ansible webservers -m ping -i inventory
ansible web01 -m ansible.builtin.yum -a "name=httpd state=present" -i inventory --become
```

### Playbooks

Define configurations using playbooks, specifying hosts, tasks, modules, and options:

- Global Area: Hosts and tasks.
- Second Level: Module name.
- Third Level: Module options.

Run playbooks with:

```bash
ansible-playbook -i inventory playbook.yaml
```

Options:

- `-C`: Dry run (recommended before actual run).
- `-v`: Verbose mode for debugging (up to 4 "v").

### Ansible Config Order

1. **ANSIBLE_CONFIG:** Environment variable, if set.
2. **ansible.cfg:** In the current directory.
3. **~/.ansible.cfg:** Hidden file in the home directory.
4. **/etc/ansible/ansible.cfg:** Global file.

### Ansible Config Settings

Basic settings in the global Ansible config file (`ansible.cfg`):

1. `force_color = False`: Turn off color.
2. `ask_pass = False`: Do not prompt for passwords; use keys.
3. `debug = False`: Enable debug mode.
4. `force = 5`: Control the number of servers turned on at a time.
5. `inventory = /etc/ansible/host`: Specify the inventory file.
6. `log_path =`: Store output in a log file.

### Ansible Variables

Places to define variables:

1. **Playbook:** Using `vars:`. Example: `http_port: 80`.
2. **Inventory Based:** Define variables outside the playbook in group_vars, host_vars, etc.
3. **Roles:** Include variables from files in the playbook.

### Fact Variables

Examples of fact variables:

1. `ansible_os_family`: OS name (e.g., RedHat, Debian).
2. `ansible_processor_cores`: Number of CPU cores.
3. `ansible_kernel`: Kernel version.
4. `ansible_devices`: Connected devices information.
5. `ansible_default_ipv4`: IP, MAC address, gateway, etc.
6. `ansible_architecture`: 64 bit or 32 bit.

### Storing Variables

1. **Module Execution:** Playbook tasks execute modules and return output.
2. **Return Output:** Stored as variables.
3. **Use Variable:** Conditions, printing, etc.