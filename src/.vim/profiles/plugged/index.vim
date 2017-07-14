let s:cwd = expand('<sfile>:p:h')
let s:light_profile_path = resolve(s:cwd . '/../light/index.vim')
let s:plugins_dir = resolve(s:cwd . '/plugins')

execute 'source ' . s:light_profile_path

call plug#begin('~/.vim/plugged')

execute 'source ' . s:plugins_dir  . '/general.vim'
execute 'source ' . s:plugins_dir  . '/appearance.vim'
execute 'source ' . s:plugins_dir  . '/git.vim'
execute 'source ' . s:plugins_dir  . '/javascript.vim'

" execute 'source ' . s:plugins_dir  . 'css.vim'
" execute 'source ' . s:plugins_dir  . 'email.vim'
" execute 'source ' . s:plugins_dir  . 'typescript.vim'
" execute 'source ' . s:plugins_dir  . 'unused.vim'

call plug#end()
