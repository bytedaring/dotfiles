" Description: Keymaps


" NERDTree
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" tagbar
" nnoremap <F7> :TagbarToggle<cr>
nnoremap <F7> :SymbolsOutline<cr>

" Find files using Telescope command-line sugar.
nnoremap <silent>ff <cmd>Telescope find_files<cr>
nnoremap <silent>fg <cmd>Telescope live_grep<cr>
nnoremap <silent>fb <cmd>Telescope buffers<cr>
nnoremap <silent>fh <cmd>Telescope help_tags<cr>

" nvim-tree
" nnoremap <silent>fi :<C-u>:NvimTreeFindFileToggle<CR>
nnoremap <silent>fi <cmd>NvimTreeFindFileToggle<CR>

" vimspector
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
