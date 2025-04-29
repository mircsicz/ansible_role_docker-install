# 📋 Changelog

All notable changes to this project will be documented in this file.

This project follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [v1.0.0] - 2025-04-27

### Added
- Initial stable release of the `docker_install` role.
- Installation of all required Docker dependencies.
- Addition of Docker GPG key and APT repository.
- Installation of Docker Engine, CLI, Containerd, and Docker Compose plugin.
- Service management with systemd (restart and enable Docker).
- Validation of Docker (`docker info`) and Docker Compose (`docker compose version`).
- Success message output after validation.
- Compatibility with Ubuntu 20.04 (Focal), 22.04 (Jammy), and 24.04 (Noble).
- Ansible Galaxy compatible `meta/main.yml`.
- Added `.gitignore` for clean Git project handling.
- Initial documentation (`README.md`).

---

## 📢 Notes
- Default user: `ansible`, customizable if needed.
- Only modern Docker setups (Compose v2) are supported.
