so ~/.vimnorc
so ~/.vimplugged

syntax on

if has("gui_macvim")
    "highlight LineNr guifg=darkgrey
    set guifont=Hack:h14
    set background=dark
    color hemisu
    "set fullscreen
else
    set t_Co=256
    " color molokai
    "highlight LineNr ctermfg=darkgrey
endif
