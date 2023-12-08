
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

require('colorscheme')
require('keymaps')
require('plugins')
require('lsp')
