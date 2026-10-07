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
"     Esc / Ctrl+c / Ctrl+[ : Exit to Normal mode
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
"   p             : Paste after cursor (or paste over highlighted visual selection)
"   u / Ctrl + r  : Undo / Redo
"   << / >>       : Un-indent / Indent line
"   Ctrl + d      : Un-indent in Insert mode
"
" --- SEARCHING ---
"   /text         : Search for 'text'
"   n / N         : Next / Previous search match
"   <Space> + h   : Clear search highlights
"
" --- VIM ARCHITECTURE (Mental Model) ---
"   Buffer        : File loaded into memory
"   Window        : Viewport displaying a buffer (multiple windows can show one buffer)
"
" --- IDE ACTIONS (PyCharm Integration) ---
"   <Space> + r   : Reformat code
"   <Space> + f   : Search Everywhere
"   <Space> + e   : File Tree toggle
"   <Space> + b   : Toggle Breakpoint
"   <Space> + ca  : Code Actions (Option+Enter)
"   ]g / [g       : Next / Previous error
"============================================================================