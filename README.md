# Scripts

This repository contains scripts I use on my linux systems.

---

**NOTE**

Please do not run any scripts without knowing what they are doing. I recommend to read the code before executing anything. Some things can break a system.

---

- [geolocation.sh](./geolocation.sh): This scripts calls https://api.ipify.org to get the public IP of the current device. Afterwards it sends a request to http://ip-api.com get geolocation information that are connected to the IP. The output is printed to the terminal.
- [update.sh](./update.sh): This update script executes updates for several tools and package managers. These include `apt`, [Spices](https://cinnamon-spices.linuxmint.com/) for the [Cinnamon Desktop](https://projects.linuxmint.com/cinnamon/), `flatpak`, `brew` and [SDKMAN!](https://sdkman.io/). This update is not "fully automated", because I want to manually confirm some of the updates.
