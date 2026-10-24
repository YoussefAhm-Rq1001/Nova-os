# Nova GNOME desktop source

This directory preserves the Nova GNOME desktop configuration in the Nova OS source repository. It includes the default Ubuntu GNOME desktop with Nova wallpapers, a bilingual Arabic and English top-center clock, the bottom dock and app grid preferences, a branded boot splash, and launchers for Bash, PowerShell, and Settings.

The files are arranged under `config/` to match the live-build overlay layout. The matching ISO builder is maintained in [YoussefAhm-Rq1001/nova-os-iso](https://github.com/YoussefAhm-Rq1001/nova-os-iso); that repository is the build entry point for producing bootable images. The WSL installer at the repository root remains independent of this GNOME desktop source.
