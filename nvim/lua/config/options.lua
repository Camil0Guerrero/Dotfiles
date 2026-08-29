vim.g.mapleader = " "

vim.scriptencoding = "utf-6"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.textwidth = 100
vim.opt.linebreak = true

vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true

vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.winborder = "rounded"
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true

vim.opt.backspace = { "start", "indent", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

vim.opt.cursorcolumn = false
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
vim.opt.statuscolumn = "%= %3l  %s "

vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

vim.opt.formatoptions:append({ "r" })

vim.opt.spelllang = 'en,es'
vim.opt.spell = true
