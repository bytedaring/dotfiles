"if !exists('*rd#save_and_exec')
"    function! rd#save_and_exec() abort 
"        if &filetype == 'vim'
"            :slient! wirte
"            :source %
"        elseif &filetype == 'lua' 
"            :slient! write
"            :luafile %
"        endif
"        
"        return
"    endfunction
"endif
