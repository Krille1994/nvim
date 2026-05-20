vim.cmd("let g:netrw_liststyle = 3")

-- Line numbers
vim.o.relativenumber = true
vim.o.number = true

-- Tabs & indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- Line wrapping
vim.o.wrap = false

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Appearance
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.signcolumn = "yes"

-- Backspace
vim.o.backspace = "indent,eol,start"

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Split windows
vim.o.splitright = true
vim.o.splitbelow = true

-- Swap / backup / undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- Scroll
vim.o.scrolloff = 8

-- Folding (treesitter-based)
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
