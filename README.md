# Ansible Configuration Management - Still WIP !!!

This repository contains Ansible configuration for automating system setup and configuration management. It includes a containerized environment for running Ansible playbooks and roles.

## Project Structure

```
.
├── Containerfile          # Container definition for Ansible environment
├── ansible/
│   ├── ansible.cfg       # Ansible configuration file
│   ├── inventory/        # Inventory configuration
│   │   ├── inventory.yaml           # Main inventory file
│   │   └── group_vars/              # Group variables
│   │       ├── all/                 # Variables for all hosts
│   │       └── client_1/            # Client-specific variables
│   ├── playbook.yaml     # Main playbook
│   └── roles/            # Ansible roles
│       └── clone_repository/  # Role for cloning repositories
└── scripts/              # Helper scripts
    └── entrypoint.sh     # Container entrypoint script
```

## Prerequisites

- Docker or Podman installed on your system
- SSH access to target machines
- Git (for cloning this repository)

## Container Environment

The project uses a containerized environment based on Ubuntu 24.10 with:
- Python 3.13
- Latest Ansible version
- Custom user 'ansible' for running playbooks

## Usage

### Building the Container

```bash
docker build -t ansible-env -f Containerfile .
# or using podman
podman build -t ansible-env -f Containerfile .
```

### Running Playbooks

```bash
docker run -it --rm \
  -v ~/.ssh:/home/ansible/.ssh:ro \
  ansible-env ansible-playbook playbook.yaml
```

## Inventory Configuration

The inventory is configured in `ansible/inventory/inventory.yaml`. Current setup includes:
- Host group: `client_1`
- Default connection settings in `group_vars/all/vars.yaml`
- Custom SSH configuration for secure connections

## Available Roles

### clone_repository
Clones specified Git repositories to target machines. Currently configured for:
- Dotfiles repository from GitHub

## Configuration

- `ansible.cfg`: Contains basic Ansible settings
- Host key checking is disabled by default
- SSH private key configuration is managed through environment variables

## Contributing

This is personal project to maintain and automate my system setup and showcase my Ansible skills. I do not expect contributions, but if you have suggestions or improvements, feel free to open an issue or pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
```
