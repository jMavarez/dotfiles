local opt = vim.opt

opt.guicursor = ""
opt.cursorline = true

opt.number = true
opt.relativenumber = true

opt.showmode = false

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.showmatch = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.signcolumn = "yes"

opt.splitright = true
opt.splitbelow = true
