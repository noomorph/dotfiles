vnoremap <Leader>fmh :!pandoc -s -f markdown -t html -o /tmp/email-pandoc.html && juice /tmp/email-pandoc.html /tmp/email-inlined.html && cat /tmp/email-inlined.html<cr>
map <Leader>md :!pandoc -s -f markdown -t html -o %f.html && juice %f.html %f.inlined.html && mv %f.inlined.html %f.html<cr>
