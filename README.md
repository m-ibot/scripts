# Linux Utility Scripts

This repository contains a collection of personal shell scripts for system maintenance, updates, and utility tasks across various Linux distributions.

---

### ⚠️ SAFETY FIRST

**Do not run any scripts without knowing what they are doing.** It is highly recommended to read the code before executing anything. Some operations require `sudo` and can affect system stability.

---

## Scripts by Distribution

### Linux Mint
- **[update-mint.sh](./update-mint.sh):** A comprehensive update script for Linux Mint desktops. 
  - **Features:** Processes updates for `apt`, Cinnamon [Spices](https://cinnamon-spices.linuxmint.com/), `flatpak`, [Homebrew](https://brew.sh/), and [SDKMAN!](https://sdkman.io/).
  - **Interaction:** This script is semi-automated; it may prompt for manual confirmation during some update phases.

### Fedora (Desktop)
- **[update-fedora.sh](./update-fedora.sh):** An update script tailored for Fedora workstations.
  - **Features:** Handles system-wide updates via `dnf`, updates `flatpak` applications, manages [Homebrew](https://brew.sh/) packages, and keeps [SDKMAN!](https://sdkman.io/) up to date.

### Fedora (Server)
- **[update-server-fedora.sh](./update-server-fedora.sh):** An advanced maintenance script for Fedora server environments.
  - **Features:** Executes `dnf` updates and autoremoves unused packages. It also handles updates for Docker-based Pi-hole installations.
  - **Health Check:** Includes a built-in check to determine if a system reboot is required after core updates. It offers options to schedule a reboot or restart immediately.

### Ubuntu (Server)
- **[update-server-ubuntu.sh](./update-server-ubuntu.sh):** A streamlined update script for Ubuntu server installations.
  - **Features:** Manages `apt` updates and upgrades, and includes native support for updating Pi-hole via `pihole -up`.

## General Utilities

- **[geolocation.sh](./geolocation.sh):** Fetches the public IP of the current device using `api.ipify.org` and retrieves detailed geolocation data from `ip-api.com`. The results are printed directly to the terminal.
  - **Dependencies:** Requires `curl` and `jq`.

---

## Global Dependencies & Conventions

### Common Tools
Most scripts rely on the following tools:
- `bash`: All scripts use the `#!/bin/bash` shebang.
- `curl`: Used for API requests.
- `jq`: Required for processing JSON (specifically in `geolocation.sh`).
- `dnf-utils` / `needrestart`: Used for reboot checks on server systems.

### Execution
Scripts are intended to be run from the terminal. Most update scripts require root privileges for package management tasks.

Example:
```bash
./update-mint.sh
```

### Coding Style
- Scripts utilize ANSI color codes for clear terminal output.
- Standardized helper functions like `print_green`, `print_cyan`, etc., are used to maintain visual consistency.
