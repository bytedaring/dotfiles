if !exists('g:loaded_defx') | finish | endif

" Define mappings
"cnoreabbrev sf Defx -listed -new
"      \ -columns=indent:mark:icon:icons:filename:git:size
"      \ -buffer-name=tab`tabpagenr()`<CR>
" nnoremap <silent>sf :<C-u>Defx -listed -resume
"   \ -columns=indent:mark:icons:filename:type:git
"    \ -buffer-name=tab`tabpagenr()`
"    \ `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <silent>sf :<C-u>
    \ Defx `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`
    \ -auto-cd
    \ -columns=mark:indent:icon:icons:filename:type:git<CR>
" nnoremap <silent>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	    " Define mappings
        setl nonumber
	    nnoremap <silent><buffer><expr> <CR>
	        \ defx#do_action('drop')
	    nnoremap <silent><buffer><expr> c
	        \ defx#do_action('copy')
	    nnoremap <silent><buffer><expr> m
	        \defx#do_action('move')
	    nnoremap <silent><buffer><expr> p
	        \ defx#do_action('paste')
	    nnoremap <silent><buffer><expr> l
	        \ defx#do_action('drop')
	    nnoremap <silent><buffer><expr> E
	        \ defx#do_action('open', 'vsplit')
	    nnoremap <silent><buffer><expr> P
	        \ defx#do_action('open', 'pedit')
	    nnoremap <silent><buffer><expr> o
	        \ defx#do_action('open_or_close_tree')
	    nnoremap <silent><buffer><expr> K
	        \ defx#do_action('new_directory')
	    nnoremap <silent><buffer><expr> N
	        \ defx#do_action('new_file')
	    nnoremap <silent><buffer><expr> M
	        \ defx#do_action('new_multiple_files')
	    nnoremap <silent><buffer><expr> C
	        \ defx#do_action('toggle_columns',
	        \                'mark:indent:icon:filename:type:size:time')
	    nnoremap <silent><buffer><expr> S
	        \ defx#do_action('toggle_sort', 'filename')
	    nnoremap <silent><buffer><expr> d
	        \ defx#do_action('remove')
	    nnoremap <silent><buffer><expr> r
	        \ defx#do_action('rename')
	    nnoremap <silent><buffer><expr> !
	        \ defx#do_action('execute_command')
	    nnoremap <silent><buffer><expr> x
	        \ defx#do_action('execute_system')
	    nnoremap <silent><buffer><expr> yy
	        \ defx#do_action('yank_path')
	    nnoremap <silent><buffer><expr> .
	        \ defx#do_action('toggle_ignored_files')
	    nnoremap <silent><buffer><expr> ;
	        \ defx#do_action('repeat')
	    nnoremap <silent><buffer><expr> h
	        \ defx#do_action('cd', ['..'])
	    nnoremap <silent><buffer><expr> ~
	        \ defx#do_action('cd')
	    nnoremap <silent><buffer><expr> q
	        \ defx#do_action('quit')
	    nnoremap <silent><buffer><expr> <Space>
	        \ defx#do_action('toggle_select') . 'j'
	    nnoremap <silent><buffer><expr> *
	        \ defx#do_action('toggle_select_all')
	    nnoremap <silent><buffer><expr> j
	        \ line('.') == line('$') ? 'gg' : 'j'
	    nnoremap <silent><buffer><expr> k
	        \ line('.') == 1 ? 'G' : 'k'
	    nnoremap <silent><buffer><expr> <C-l>
	        \ defx#do_action('redraw')
	    nnoremap <silent><buffer><expr> <C-g>
	        \ defx#do_action('print')
	    nnoremap <silent><buffer><expr> cd
	        \ defx#do_action('change_vim_cwd')
        nnoremap <silent><buffer><expr> > defx#do_action('resize',
	        \ defx#get_context().winwidth + 5)
	    nnoremap <silent><buffer><expr> < defx#do_action('resize',
	        \ defx#get_context().winwidth - 5)
	endfunction

call defx#custom#option('_', {
    \ 'winwidth': 48,
    \ 'direction': 'topleft',
    \ 'split': 'vertical',
    \ 'show_ignored_files': 1,
    \ 'buffer_name': '',
    \ 'toggle': 1,
    \ 'resume': 1,
    \ })

call defx#custom#column('filename', {
    \ 'max_width': 35,
    \ 'min_width': 10,
    \})

call defx#custom#column('icon', {
    \ 'directory_icon': '▸ ',
    \ 'opened_icon': '▾ ',
    \ 'root_icon': ' ',
    \ })
call defx#custom#column('git', 'indicators', {
    \ 'Modified'  : 'M',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Ignored'   : '☒',
    \ 'Deleted'   : '✖',
    \ 'Unknown'   : '?'
    \ }) 

