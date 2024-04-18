vim.loader.enable()
--设置leader键
--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.option")
require("config.keymaps")
