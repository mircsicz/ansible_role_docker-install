# Docker Install Role

This Ansible role installs and configures Docker and the Docker Compose plugin on an Ubuntu system.

## Features

- Installs required Docker dependencies
- Adds the official Docker GPG key
- Configures the Docker APT repository
- Installs Docker Engine, CLI, Containerd, and the Docker Compose plugin
- Ensures Docker service is running and enabled at boot
- Validates Docker and Docker Compose installation
- Provides a success message after installation

## Requirements

- Ubuntu 20.04 (Focal), 22.04 (Jammy), or 24.04 (Noble)
- Root privileges (become: true)
- The `ansible` user should exist (or adjust accordingly)

## Usage

Example Playbook:

```yaml
- hosts: your_target_machines
  become: true
  roles:
    - role: docker_install
```

## Tags

- `docker`: Installs, configures, and validates Docker.

## Notes

- This role uses the new Docker Compose v2 plugin (`docker compose` instead of the legacy `docker-compose` command).
- The `ansible` user is added to the `docker` group to allow Docker commands without `sudo`.

## Authors

- Created by [Mirco Schmidt](mailto:mirco@jumi.love)
