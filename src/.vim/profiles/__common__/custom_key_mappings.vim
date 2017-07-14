map <Leader>sj :set syntax=javascript<CR>
map <Leader>sh :set syntax=html<CR>
map <Leader>fn :set nofoldenable<CR>
map <Leader>fi :set foldmethod=indent<CR>
map <Leader>i2 :set ts=2 sw=2 sts=2<CR>
map <Leader>i4 :set ts=4 sw=4 sts=4<CR>
map <Leader>cd :cd %:h<CR>
map <Leader>c- :cd -<CR>
map <Leader>cp :read!pbpaste<CR>
map <Leader>cf :!cat % \| pbcopy<CR>
map <Leader>cc :!pbcopy<CR>u
map <Leader>sw :w !sudo tee %<CR>
map <Leader>as :mksession! ~/auto.vimsession<CR>
map <Leader>ts :read!date -u +"\%Y-\%m-\%dT\%H:\%M:\%S"<CR>
map <Leader>tt :!npm test<CR>
