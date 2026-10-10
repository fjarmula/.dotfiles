" ============================================================================
" QUICK CHEAT SHEET 
"
" --- NAVIGATION (Movement / Motions) ---
"   h / j / k / l : Left / Down / Up / Right
"   w / b         : Next word start / Previous word start
"   0             : First column of line (zeroth character)
"   _             : First non-blank character of line
"   $             : End of line
"   gg / G        : Top of file / Bottom of file
"   %             : Jump to matching bracket / parenthesis / brace
"   Ctrl + d / u  : Scroll half page down / up
"
" --- HORIZONTAL LINE MOTIONS (Character Searching) ---
"   f{char} / F{char} : Find {char} forward / backward on line
"   t{char} / T{char} : Until {char} forward / backward (lands one character before)
"   ; / ,             : Repeat last f/F/t/T search forward / backward
"
" --- ANATOMY OF A MOTION (Counts & Combos) ---
"   [count] + Motion : Repeat motion [count] times (e.g., 8k = 8 lines up)
"   [command] + [count] + [motion] : Apply action over motion (e.g., d3j, y5j)
"   d f{char} / d t{char}         : Delete including / up to {char}
"   d 2f{char}                    : Delete forward to 2nd occurrence of {char}
"
" --- MODES & INSERT VARIATIONS ---
"   Normal Mode   : Default mode for navigation & running commands
"   Insert Mode   : For typing text
"     i / I       : Insert before cursor / at start of line (first non-blank)
"     a / A       : Append after cursor / at end of line
"     o / O       : Open line below / above & enter Insert mode
"     jk          : Fast escape from Insert mode to Normal mode
"     Esc / Ctrl+c: Exit to Normal mode
"   Visual Mode   : For highlighting text regions
"     v           : Character-wise Visual mode
"     Shift + v   : Line-wise Visual mode
"   Command Mode  : Enter with `:` to execute editor commands
"     :w          : Save / write current file
"     :wq         : Save and quit
"
" --- EDITING, DELETING, YANKING & PASTING ---
"   x             : Delete single character
"   dw / db       : Delete word forward / backward
"   dd            : Delete entire line
"   yy / y        : Yank (copy) entire line / Yank selected text
"   p             : Paste after cursor (uses system clipboard: unnamedplus)
"   u / Ctrl + r  : Undo / Redo
"   << / >>       : Un-indent / Indent line
"   Ctrl + d      : Un-indent in Insert mode
"
" --- SEARCHING & FINDING (Telescope) ---
"   /text         : Search for 'text' in buffer
"   n / N         : Next / Previous search match
"   <Space> + h   : Clear search highlights (or Esc in Normal mode)
"   <Space> + f   : Find files in project (Telescope)
"   <Space> + ff  : Find files in project (Telescope)
"   <Space> + fg  : Live grep search text in project (Telescope)
"   <Space> + fb  : Find open buffers (Telescope)
"
" --- VIM ARCHITECTURE & TERMINAL INTEGRATION ---
"   Buffer        : File loaded into memory
"   Window        : Viewport displaying a buffer
"   Cmd + D       : Split Ghostty terminal pane
"   Cmd + [ / ]   : Switch between Ghostty splits (Neovim / Terminal)
"
"   " --- FILE TREE (Neo-tree) ---
"   <Space> + e   : Toggle File Tree Explorer
"   Shift + h     : Toggle hidden files/folders (.git, .gitignore, dotfiles)
"   A             : Add new file / folder (append `/` for folder)
"   d             : Delete file / folder
"   r             : Rename file / folder
"   y             : Copy relative path of file
"
" --- NEOVIM SETUP & IDE ACTIONS ---
"   <Space> + r   : Format code (Conform: Ruff, else Black, else LSP)
"   <Space> + ca  : Code Actions / Quick Fix (LSP)
"   K             : Show hover documentation / type info (LSP)
"   grn / grr     : Rename symbol / Find references (LSP)
"   ]g / [g       : Next / Previous diagnostic error/warning
"   :LspInfo       : Show the native LSP health/status report
"   :lsp restart   : Restart LSP clients attached to the current buffer
"   :Mason        : Package manager for LSPs, formatters & linters
"   :Lazy         : Plugin manager status
"
" --- AI & COMPLETION (nvim-cmp & Copilot) ---
"   Tab / S-Tab   : Navigate autocompletion menu
"   Enter         : Confirm autocompletion item
"   Cmd + Shift + >: Accept Copilot inline suggestion in Ghostty (sends Ctrl-F)
"   Ctrl + F       : Accept Copilot inline suggestion in Insert mode
"   Ctrl + Space   : Open the completion menu
"   Ctrl + E       : Close the completion menu
"   Ctrl + B / Alt + F : Scroll completion documentation backward / forward
"
" --- GIT INTEGRATION (Gitsigns) ---
"   Gutter signs  : ▎ (added/changed),  (deleted)
"   ]h / [h       : Next / Previous Git hunk
"   <Space> + hp  : Preview Git hunk diff floating window
"============================================================================
