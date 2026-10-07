" ============================================================================
" QUICK CHEAT SHEET
"
" --- NAVIGATION (Movement / Motions) ---
"   h / j / k / l : Left / Down / Up / Right
"   w / b         : Next word start / Previous word start
"   0 / $         : Start of line / End of line
"   gg / G        : Top of file / Bottom of file
"   Ctrl + d / u  : Scroll half page down / up
"
" --- ANATOMY OF A MOTION (Counts & Combos) ---
"   [count] + Motion : Repeat motion [count] times (e.g., 8k = 8 lines up)
"   [command] + [count] + [motion] : Apply action over motion (e.g., d3j, y5j)
"
" --- MODES ---
"   Normal Mode   : Default mode for navigation & running commands
"   Insert Mode   : For typing text
"     i / a       : Insert before cursor / Append after cursor
"     o           : Open new line below & enter Insert mode
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
" --- IDE ACTIONS (PyCharm Integration) ---
"   <Space> + r   : Reformat code
"   <Space> + f   : Search Everywhere
"   <Space> + e   : File Tree toggle
"   <Space> + b   : Toggle Breakpoint
"   <Space> + ca  : Code Actions (Option+Enter)
"   ]g / [g       : Next / Previous error
"============================================================================
