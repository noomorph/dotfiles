so ~/.vimnorc
so ~/.vimplugged

syntax on

if has("gui_macvim")
    set shell=/bin/bash
    "set guifont=Consolas\ for\ Powerline:h13
    set background=light
    "set anti
    set transparency=0
    color visualstudio
    set guifont=Terminus\ \(TTF\):h16
    set noanti
    " set fullscreen
    highlight LineNr guifg=darkblue
    highlight CursorLineNr guifg=black
else
    set t_Co=256
    color molokai
    " hi Normal ctermbg=none
    "highlight LineNr ctermfg=darkgrey
endif
