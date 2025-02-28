[日本語版を表示する](./README_ja.md)
# Nix Darwin Dotfiles

A comprehensive dotfiles setup for Apple Silicon Macs using nix-darwin. Configure your entire macOS environment with a single command!

## Features

- 🛠 macOS system preferences optimization
- 🐚 Modern shell setup via Home Manager
- 📦 Automated CLI tool installation
- 🖥 GUI application management via Homebrew
- ⚡️ Fast and reproducible setup

## System Requirements

### Hardware
- Apple Silicon Mac (M1/M2/M3/M4 series)

### Software
- macOS Big Sur or later
- Internet connection

### Recommended
- Fresh macOS installation
- No existing Homebrew installation
- No existing nix installation

## ⚠️ Backup Required

Before proceeding, backup these configurations:
1. Homebrew configurations and packages
2. Shell configurations (~/.zshrc, ~/.bashrc)
3. Any existing nix configurations

## Installation

1. Clone the repository:
```bash
cd <YOUR_DESIRED_LOCATION>
git clone git@github.com:atalienet/dotfiles.git
```
2. Update your username in the ./env.nix file. Replace any occurrences of the default username with your actual username. For example, change:

```nix
{
  default = {
    system = "aarch64-darwin";
    username = "u1";
  };

  username = "u1";
}
to:
{
  default = {
    system = "aarch64-darwin";
    username = "<YOUR_USERNAME>";
  };

  username = "<YOUR_USERNAME>";
}
```

3. Run the setup:
```bash
nix run nix-darwin/nix-darwin-24.11#darwin-rebuild -- switch --flake <YOUR_DESIRED_LOCATION>/dotfiles/nix-darwin.#default
```

4. Restart your Mac to apply all settings!

## Configuration Management

### Apply Changes
```bash
darwin-rebuild switch --flake <YOUR_DESIRED_LOCATION>/dotfiles/nix-darwin.#default
```


## Included Software

### Development Tools
- **GnuPG**: Encryption and signing
- **pinentry-mac**: macOS-native password entry dialog
- **Xcodes**: The best command-line tool to install and switch between multiple versions of Xcode
- **1Password CLI**: Command-line interface for 1Password password manager

### Terminal Emulators
- **Rio**: Modern GPU-accelerated terminal emulator with Rust
- **Ghostty**: High-performance terminal with excellent font rendering
- **WezTerm**: GPU-accelerated cross-platform terminal emulator

### System Utilities
- **CoconutBattery**: Detailed battery information and health monitoring
- **KeyClu**: Visual keyboard shortcut helper and discovery tool

### Installation Methods

| Application | Installation Method | Type | Description |
|-------------|-------------------|------|-------------|
| GnuPG | nix-darwin | CLI | Encryption and signing tool |
| pinentry-mac | nix-darwin | CLI | macOS-native password entry dialog |
| Xcodes | Homebrew | GUI | Xcode version manager |
| 1Password CLI | Homebrew | CLI | Password manager CLI |
| Rio | Homebrew | GUI | Rust-based terminal emulator |
| Ghostty | Homebrew | GUI | Modern GPU-accelerated terminal |
| WezTerm | Homebrew | GUI | Cross-platform terminal |
| CoconutBattery | Homebrew | GUI | Battery health monitor |
| KeyClu | Homebrew | GUI | Keyboard shortcut discovery |

## Roadmap

| Priority | Feature | Target Date | Status |
|----------|---------|-------------|---------|
| 🔥 High | Modularize configurations | Feb 2025 | In Progress |
| 🔥 High | Homebrew tap support (aerospace) | Feb 2025 | Planned |
| 🔥 High | Flexible env variables | Feb 2025 | Planned |
| ⚡️ Medium | Enhanced Zsh configuration | Apl 2025 | Planned |
| ⚡️ Medium | Neovim configuration | Feb 2025 | Planned |
