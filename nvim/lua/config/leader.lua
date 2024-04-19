vim.loader.enable()
--设置leader键, before load plugins
--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.loader.enable()
vim.g.mapleader = " "
vim.g.maplocalleader = " "
