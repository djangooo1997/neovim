require('init-packer')
require('init-tree')
require('keybindings')
require('whichkey')
require('init-lsp')
require('neovim-cmake')
require('dap.nvim-dap')
require('lsp')
require('utils')
require('usr.toggleterm')


vim.cmd('set smartcase')
vim.cmd('set ignorecase')
vim.cmd('set number')
vim.cmd('set hlsearch')
vim.cmd('set incsearch')
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.cursorline = true
vim.g.mapleader = ' '
