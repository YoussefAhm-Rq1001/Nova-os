# Nova OS

Nova OS is a custom Linux environment for WSL, based on Ubuntu. The repository also keeps the Nova GNOME desktop and boot configuration used by the separate bootable image project.

## WSL install

1. Install WSL and Ubuntu in an administrator PowerShell:

       wsl --install -d Ubuntu

2. Open Ubuntu and run:

       git clone https://github.com/YoussefAhm-Rq1001/Nova-os
       cd Nova-os
       bash setup.sh

3. Restart the Ubuntu terminal.

The setup adds Nova's terminal welcome, fastfetch configuration, shell prompt, and command-line tools.

## WSL commands

- `nova-info` displays the system summary and available Nova commands.
- `nova-version` displays the Nova OS version.
- `nova-update` updates Ubuntu packages.

## Nova desktop and boot support

The `desktop/config/` directory contains Nova's GNOME desktop source: wallpapers, bilingual Arabic and English clock extension, dock and appearance defaults, boot splash, app launchers, live-build package hooks, and BIOS/UEFI boot support.

The x64 Nova OS image supports Legacy BIOS, x64 UEFI, and IA32 (32-bit) UEFI firmware on x64 processors. The OS kernel is 64-bit; IA32 UEFI support is a firmware loader path and does not support 32-bit CPUs. Secure Boot is not supported by the custom unsigned EFI loader.

The bootable image builder and release files are maintained separately in [nova-os-iso](https://github.com/YoussefAhm-Rq1001/nova-os-iso). The desktop source here is a source snapshot; the ISO project remains the build entry point.

## License

MIT
