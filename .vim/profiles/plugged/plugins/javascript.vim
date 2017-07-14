Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }

Plug 'heavenshell/vim-jsdoc',   { 'for': 'javascript' }
map <Leader>jd :JsDoc<CR>

Plug 'marijnh/tern_for_vim',    { 'for': 'javascript' }
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
let tern#is_show_argument_hints_enabled=1
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType javascript map <C-]> :TernDef<CR>

Plug 'maksimr/vim-jsbeautify' ",     { 'for': ['html','css', 'javascript', 'json'] }
" vnoremap <Leader>fbh :call HtmlBeautify()<cr>
" vnoremap <Leader>fbc :call CSSBeautify()<cr>
" vnoremap <Leader>fbj :call JsBeautify()<cr>
