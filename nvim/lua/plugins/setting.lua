local opt = vim.opt
local g = vim.g
local o = vim.o
local wo = vim.wo

-- 禁用netrw等默认内置插件
local builtin_plugs = {
  '2html_plugin',
  'getscriptPlugin',
  'getscript',
  'gzip',
  'logiPat',
  'matchparen',
  'matchit',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'remote_plugins',
  'rrhelper',
  'tar',
  'tarPlugin',
  'spellfile_plugin',
  'tutor_mode_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}
for i = 1, #builtin_plugs do
  g['loaded_' .. builtin_plugs[i]] = 1
end

opt.lazyredraw = true
-- 不兼容模式
vim.cmd[[set nocompatible ]]
-- 启用鼠标
o.mouse = 'a'

-- shada
o.shada = "!,'15,<30,s10,h"

-- 0: 不显示 1: 启动显示转态行 2: 总是显示状态行 3: 总是显示且显示最后一个windows的状态行
o.laststatus = 3

vim.cmd[[set autowrite]]
opt.list = true

-- 递归搜索文件路径
-- opt.path+="**"

-- 设置默认编码格式
opt.encoding = "utf-8"
-- 缩进配置为2空格
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
-- 表示Tab自动转换成空格
opt.expandtab = true
-- 表示换行后自动缩进
opt.autoindent = true
-- 智能对齐
opt.smartindent = true

-- 设置折叠方式
opt.foldmethod = "indent"
vim.cmd[[ set nofoldenable ]]
opt.foldlevel = 2

-- show cursor line
o.cursorline = true

-- indentLine
-- g.indentLine_char = 'c'
--
-- 当文件在外部被修改时，自动重新读取
-- set autoread

-- 显示行号、 显示当前行行号，其它行的行号都是以当前行为基准从 1 开始增加（即相对行号）
wo.number = true
opt.relativenumber = true
-- 允许自动换行
opt.wrap = true
opt.linebreak = true

-- 开启真彩色
opt.termguicolors = true

-- 搜索时忽略大小写
o.ignorecase = true

-- signcolumn 'scl': display signs in the 'number' column
o.signcolumn = 'number'

-- 设置默认winhl
vim.api.nvim_win_set_option(0, 'winhl', 'Normal:Normal,FloatBorder:FloatBorder')

-- vim操作作用到系统clipboard
vim.cmd[[ set clipboard+=unnamedplus ]]

-- vimspector 图形调试器
g.vimspector_enable_mappings = 'HUMAN'
vim.cmd[[ let g:vimspector_install_gadgets = [ 'debugpy', 'delve', 'CodeLLDB' ] ]]

--------------- Color scheme -----------------
-- 启用语法高亮、拼写检查
local syntax_group = vim.api.nvim_create_augroup("syntax_group", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "awk" },
  command = "syntax on",
  group = syntax_group,
})
---------- Spell Check  --------------------
vim.opt.spelloptions = 'camel'
local spell_group = vim.api.nvim_create_augroup("spell_group", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "go", "javascript", "rust", "zig" },
  command = "setlocal spell spelllang=en_us,cjk",
  group = spell_group,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  command = "setlocal nospell",
  group = spell_group,
})
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nospell",
  group = spell_group,
})

--------------- Blame -----------------
g.gitblame_highlight_group = 'Comment'
g.gitblame_message_template = '          <date> • <author> • <summary>'
g.gitblame_date_format = '%r'
g.gitblame_ignored_filetypes = {
  'NvimTree', 'packer', 'Trouble', 'dap-repl', 'dapui_watches',
  'dapui_breakpoints', 'dapui_scopes', 'dapui_stacks'
}

--------------- Python3 -----------------
g.python3_host_skip_check = 1
g.python3_host_prog = '/Users/xiaoxiwang/opt/miniconda3/bin/python3'


--设置leader键
--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

