let s:cwd = expand('<sfile>:p:h')
let s:common_dir = resolve(s:cwd . '/../__common__')

execute 'source ' . s:common_dir  . '/base_defaults.vim'
execute 'source ' . s:common_dir  . '/file_extension_associations.vim'
execute 'source ' . s:common_dir  . '/copy_paste_indentation.vim'
execute 'source ' . s:common_dir  . '/replace_without_buffers.vim'
execute 'source ' . s:common_dir  . '/moving_line_up_down.vim'
execute 'source ' . s:common_dir  . '/whole_selection_search.vim'
execute 'source ' . s:common_dir  . '/custom_key_mappings.vim'
