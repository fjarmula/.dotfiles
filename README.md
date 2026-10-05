# Dotfiles

Personal environment configurations for **macOS**, managed via **Zsh**, **Starship**, and **Ghostty**.

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
git clone https://github.com/fjarmula/dotfiles.git ~/Documents/Setups/dotfiles
```
### 2. Navigate into the directory
```bash
cd ~/Documents/Setups/dotfiles
```

### 3. Make the bootstrap script executable
```bash
chmod +x bootstrap.sh
```

### 4. Run the setup
```bash
./bootstrap.sh
```