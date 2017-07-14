Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi'
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript map <C-]> :TsuDefinition<CR>
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
