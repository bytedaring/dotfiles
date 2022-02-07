"
"lua <<EOF
"
"local saga = require 'lspsaga'
"saga.init_lsp_saga()
"
"EOF
"
"" Lspsaga 插件没有配置成功，今天不弄了
"" 异步lsp查找
"nnoremap <silent> gh :Lspsaga lsp_finder<CR>
"" Code Action
"nnoremap <silent><leader>ca :Lspsaga code_action<CR>
"vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
"" 悬停文档
"nnoremap <silent>K :Lspsaga hover_doc<CR>
"" scroll down hover doc or scroll in definition preview
"nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
"" scroll up hover doc
"nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
"" help
"nnoremap <silent> gs :Lspsaga signature_help<CR>
"" 重命名
"nnoremap <silent> ggr :Lspsaga rename<CR>
"" 预览定义
"nnoremap <silent> gd :Lspsaga preview_definition<CR>
"" 浮动终端
"nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
"tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>
"
