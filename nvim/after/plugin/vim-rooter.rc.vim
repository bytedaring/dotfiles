if !exists('g:loaded_rooter')
  echom "Not loaded vim-rooter"
  finish
endif


" let g:rooter_targets = '/,*'
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']
