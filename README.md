# Dotfiles

Personal environment configurations for macOS, managed via Zsh, Starship, Ghostty, Raycast, Neovim, and IdeaVim.

## Quick Installation

Deploy the environment on a fresh macOS installation:

```bash
curl -fsSL https://raw.githubusercontent.com/fjarmula/dotfiles/main/bootstrap.sh | bash
```

## Standard Installation

### 1. Clone the repository

```bash
git clone https://github.com/fjarmula/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. Run the bootstrap script

```bash
chmod +x bootstrap.sh
./bootstrap.sh
```

### 3. Restore Homebrew packages

```bash
brew bundle --file=Brewfile
```

## Reference

A complete reference for Neovim keymaps, LSP bindings, and terminal integration is available in `cheatsheet.vim`.

## Window management

AeroSpace manages only virtual workspaces. Every newly detected window
floats; Raycast handles all window positioning and sizing. Bootstrap preserves
the existing AeroSpace symlink at `~/.config/aerospace`.

| Shortcut | Action | Owner |
| --- | --- | --- |
| Option + 1–7 | Switch workspace | AeroSpace |
| Option + Shift + 1–7 | Move window to workspace | AeroSpace |
| Option + Tab | Previous workspace | AeroSpace |
| Option + Shift + Tab | Move workspace to next monitor | AeroSpace |
| Option + Cmd + H | Left Half | Raycast |
| Option + Cmd + L | Right Half | Raycast |
| Option + Cmd + K | Top Half | Raycast |
| Option + Cmd + J | Bottom Half | Raycast |
| Option + F | Maximize | Raycast |
| Option + Cmd + C | Almost Maximize | Raycast |

Maximize fills the available screen inside the current workspace; it does not
create a native macOS fullscreen Space. Almost Maximize uses Raycast's centered
90% preset. AeroSpace has no tiling, resize, join, or fullscreen bindings.
Existing workspace-to-monitor assignments are retained. AeroSpace has no window
focus shortcuts, service mode, or mouse-warp callback. It still tracks windows
and hides/shows them to implement virtual workspaces; floating mode keeps it
from tiling them.

Raycast's old Control + Option corner shortcuts are cleared. Use Option + Cmd +
H/J/K/L for halves; those keys do not move windows into corners.

### Restore Raycast on a fresh Mac

Bootstrap installs Raycast and disables only Spotlight's Cmd + Space shortcut
(symbolic hotkey 64), leaving other system shortcuts intact. Log out and back
in if macOS continues to intercept that shortcut.

Bootstrap opens [`raycast/window-management.rayconfig`](raycast/window-management.rayconfig)
in Raycast. Finish these steps in the app:

1. Complete Raycast's first-run setup if prompted. If the import does not open,
   run **Import Settings & Data** and select the backup file.
2. Enter the export passphrase you set when this backup was created. It is not
   stored in this repository.
3. Select only **Settings, Aliases & Hotkeys**, leaving other data categories
   unchecked, and finish the import. This restores the six shortcuts above as
   well as the other Raycast preferences/hotkeys present in the snapshot.
4. Grant Raycast access in **System Settings → Privacy & Security → Accessibility**
   when prompted. AeroSpace also needs its existing Accessibility permission.
5. Bind Raycast's launcher to **Cmd + Space** in Raycast Settings if needed,
   and enable launch at login if desired. Check all six window shortcuts on a
   normal resizable window.

To reopen the import without rerunning the full bootstrap:

```bash
bash ~/.dotfiles/raycast/restore.sh
```

Fully unattended hotkey restoration is not supported by this workflow: Raycast
requires a passphrase and an interactive category selection. The actual hotkeys
were configured and verified in Raycast 2.12.1 before exporting this backup.

### Storage and backup maintenance

Inspection of Raycast 2.12.1 found no Window Management command hotkeys in
`~/Library/Preferences/com.raycast.macos.plist` (including no relevant
`windowManagement`, `extensions`, or `NSUserKeyEquivalents` hotkey dictionaries).
Its app-support directory contains encrypted databases, including `settings.db`
and `settings_v2.db`, which ordinary SQLite cannot read. Do not symlink these
databases or write invented plist keys: use Raycast's supported importer.

The committed `.rayconfig` is an encrypted **full Raycast export**, not a
hotkeys-only file. Keep the passphrase outside Git. Raycast includes other data
categories in exports, so treat future backups as private even when encrypted.
To update the snapshot, run **Export Settings & Data**, choose a local folder,
then replace `raycast/window-management.rayconfig` with the new export after
reviewing which settings and data you are preserving. Keep the shortcut table
above in sync. Import only the settings category on the destination Mac.

See Raycast's [Import & Export](https://manual.raycast.com/import-export) and
[Window Management](https://manual.raycast.com/window-management) documentation.

### Apply AeroSpace changes

The linked config reloads automatically. To validate and reload manually:

```bash
aerospace reload-config --dry-run
aerospace reload-config
```

The floating callback applies to newly detected windows. To float windows that
were already open before the config changed, run:

```bash
aerospace run-callback --for-every-window on-window-detected
```
