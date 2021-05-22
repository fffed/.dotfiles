local o = vim.o   -- global options
local wo = vim.wo -- window-local options
local bo = vim.bo -- buffer-local options


-- -- <TAB> 
bo.tabstop     = 4                        --number of spaces that a <Tab> in the file counts for
bo.shiftwidth  = 4                        --number of spaces to use for each step of (auto)indent
bo.softtabstop = 4                        --number of spaces that a <Tab> counts for while performing editing operations
bo.expandtab   = true                     --in Insert mode: use the appropriate number of spaces to insert a <Tab>
o.shiftround   = true                     --round indent to multiple of 'shiftwidth', applies to > and < commands

-- -- SPLITS
o.splitbelow   = true                     --horizontal splits will be below
o.splitright   = true                     --vertical splits will be to the right
o.diffopt      = o.diffopt .. ',vertical' --Diff vertically instead of horizontally

o.title        = true                     --turn on current file name for window title
o.hidden       = true                     --make possible to switch buffers without saving
o.scrolloff    = 5                        --add scroll offset while scrolling
o.ignorecase   = true                     --ignore case in search patterns
o.smartcase    = true                     --override the 'ignorecase' option if the search pattern contains upper case characters
o.listchars   = 'tab:▸·,trail:·'          --to override default from "tab:> ,trail:-,nbsp:+"
o.clipboard    = 'unnamedplus'            --To ALWAYS use the clipboard for ALL operations (instead of interacting with the '+' and/or '*' registers explicitly)

wo.number      = true                     --print the line number in front of each line
wo.wrap        = false                    --display long lines as one line
wo.cursorline  = true                     --highlighting of the current line
wo.list        = true                     --show special characters for tabs, spaces, etc


bo.spelllang   = 'en_us,ru_yo'            --set languages for spell checking
bo.smartindent = true                     --do smart autoindenting when starting a new line
bo.undofile    = true                     --automatically saves undo history to a file when writing a buffer to a file, and restores undo history from the same file on buffer read

