# Dotfiles

Personal environment configurations for **macOS**, managed via **Zsh**, **Starship**, and **Ghostty**.

The repository mirrors the paths under the home directory. For example, Ghostty
lives at `.config/ghostty/config` and Neovim at `.config/nvim`; the bootstrap
script symlinks only the configurations managed by this repository.

---

## Quick Installation (Automated)

Deploy the entire environment with a single command on a fresh installation:

```bash
curl -fsSL https://raw.githubusercontent.com/fjarmula/dotfiles/main/bootstrap.sh | bash
```

## Standard Installation

Clone the repository locally, grant execution permissions, and run the bootstrap script:

### 1. Clone the repository

```bash
git clone https://github.com/fjarmula/dotfiles.git ~/.dotfiles
```

### 2. Navigate into the directory

```bash
cd ~/.dotfiles
```

### 3. Make the bootstrap script executable

```bash
chmod +x bootstrap.sh
```

### 4. Run the setup

```bash
./bootstrap.sh
```
