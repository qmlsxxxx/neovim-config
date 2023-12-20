
--local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
--vim.cmd.source(vimrc)

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.background = 'dark'
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.history = 1000
vim.opt.ruler = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.backup = false
vim.opt.swapfile = false

require('plugins')
require('impatient')
require('colorscheme')
require('lsp')
require('keymaps')
--require('reload')

require('config/nvim-telescope')
require('config/nvim-tree')
require('config/nvim-cmp')
--require('config/nvim-bufferline')
require('config/nvim-barbar')
require('config/nvim-toggleterm')
require('config/nvim-remember')
