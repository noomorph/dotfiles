so ~/.vimnorc
so ~/.vimplugged

if has("gui_macvim")
    set guifont=Fantasque\ Sans\ Mono:h14
    " set transparency=0
    " highlight LineNr guifg=darkblue
    " highlight CursorLineNr guifg=black
else
    set t_Co=256
endif

set background=dark
color gruvbox
