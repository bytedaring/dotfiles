# Neovim 插件配置

## 当前使用的配置

- 目录管理 - ~~[nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)~~ [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- 高度可扩展模糊搜索 - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- fzf插件 - [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
  提升性能、支持忽略大小写
- 代码缩略图 - ~~[tagbar](https://github.com/majutsushi/tagbar)~~ ~~[symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)~~
  [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)
- 主题配色 - [molokai.nvim](https://github.com/tanvirtin/monokai.nvim) [catppuccin/nvim](https://github.com/catppuccin/nvim)
  [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- 状态栏 - [lualine](https://github.com/nvim-lualine/lualine.nvim)
- 启动屏 - ~~[vim-stratify](https://github.com/mhinz/vim-startify)~~
- LSP - [lspconfig](https://github.com/neovim/nvim-lspconfig)
- 改善Neovim LSP 体验 - [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)
- Rename - ~~[lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)~~ [ince-rename](https://github.com/smjonas/inc-rename.nvim)
- 键入时LSP签名提示 - ~~[lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)~~
  [noice.nvim](https://github.com/folke/noice.nvim)
- UI改善取代`messages`、`cmdline`、`popupmenu` - [noice.nvim](https://github.com/folke/noice.nvim)
- 控制台 - [toggleterm](https://github.com/akinsho/toggleterm.nvim)
- GIT - [fugitive](https://github.com/tpope/vim-fugitive)、[lazygit](https://github.com/lewis6991/gitsigns.nvim)
- 注释 - ~~[comment](https://github.com/numToStr/Comment.nvim)~~ 0.10 版本后neovim自带该功能
- 自动括号补全 - [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- 自动补全html tag - [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- Blame text - [gitsigns](https://github.com/lewis6991/gitsigns.nvim) ~~[git-blame.nvim](https://github.com/f-person/git-blame.nvim)~~
- Git diff - ~~[diffview](https://github.com/sindrets/diffview.nvim)~~ [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- 代码自动补全 - ~~[coq_nvim](https://github.com/ms-jpq/coq_nvim)~~ [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- 图标 - [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- 代码高亮着色 - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- 空白缩进高亮 - [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- 调试器 - [puremourning/vimspector](https://github.com/puremourning/vimspector)
- DAP client - [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- DAP ui - [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- 十六进制文本颜色高亮 - [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
- 高亮游标下文本 - ~~[RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)~~
  [nvim-cursorword](https://github.com/xiyaowong/nvim-cursorword)
- 标题栏 - [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- trouble窗口 - [trouble.vim](https://github.com/folke/trouble.nvim)
- 根目录定位器 - ~~[vim-rooter](https://github.com/airblade/vim-rooter) 打开一个文件或者目录时，将项目根目录作为工作目录~~
- Markdown预览 - [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- 代码格式化 - ~~[neoformat](https://github.com/sbdchd/neoformat)~~ [conform.nvim](https://github.com/stevearc/conform.nvim)
- 异步Linter - [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- 通知管理器 - [nvim-notify](https://github.com/rcarriga/nvim-notify)
- AI - [codeium](https://github.com/Exafunction/codeium.nvim)

## TODO

- rust

对于rust开发环境可以使用插件[rust-tools](https://github.com/simrat39/rust-tools.nvim)

- A pretty diagnostics list (优美的诊断信息列表)

[folke/trouble.nvim](https://github.com/folke/trouble.nvim)

## tips

vim编辑文件唤出nvim-tree时，进入被编辑文件目录，而不是进入键入vim命令时的所在目录：

```vim
autocmd BufEnter * silent! lcd %:p:h
```
