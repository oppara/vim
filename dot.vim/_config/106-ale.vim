" dense-analysis/ale: Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
" https://github.com/dense-analysis/ale

if empty(globpath(&rtp, 'autoload/ale.vim'))
  finish
endif

nmap <silent> ek <Plug>(ale_previous_wrap)
nmap <silent> ej <Plug>(ale_next_wrap)
nmap <silent> ef <Plug>(ale_fix)
nmap <silent> al <Plug>(ale_toggle)

highlight ALEError ctermfg=196 ctermbg=228
highlight ALEErrorSign ctermfg=202 ctermbg=none
highlight ALEErrorLine term=underline cterm=underline

let g:ale_sign_warning = '!'
let g:ale_sign_error = 'X'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}}
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1
" let g:ale_fix_on_save = 1
" let g:ale_open_list = 0
let g:ale_linters = {
            \ 'html': ['htmlhint'],
            \ 'javascript': ['eslint'],
            \ 'json': ['jsonlint'],
            \ 'php': ['php', 'phpcbf'],
            \ 'perl': ['perl', 'perlcritic'],
            \ 'ruby': ['ruby'],
            \ 'markdown': ['textlint'],
            \ 'css': [],
            \ 'scss': [],
            \ 'sass': [],
            \ 'less': [],
            \}
            " \ 'css': ['stylelint'],
            " \ 'scss': ['stylelint'],
            " \ 'sass': ['stylelint'],
            " \ 'less': ['stylelint'],
let g:ale_fixers = {
            \ 'html': ['prettier'],
            \ 'javascript': ['prettier'],
            \ 'typescript': ['prettier'],
            \ 'vue': ['prettier'],
            \ 'json': ['prettier'],
            \ 'graphql': ['prettier'],
            \ 'markdown': ['textlint', 'prettier'],
            \ 'yaml': ['prettier'],
            \ 'lua': ['prettier'],
            \ 'css': ['prettier'],
            \ 'less': ['prettier'],
            \ 'scss': ['prettier'],
            \}
let g:ale_fix_on_save_ignore = {
            \ 'html': ['prettier'],
            \ 'javascript': ['prettier'],
            \ 'typescript': ['prettier'],
            \ 'vue': ['prettier'],
            \ 'json': ['prettier'],
            \ 'graphql': ['prettier'],
            \ 'markdown': ['prettier'],
            \ 'yaml': ['prettier'],
            \ 'lua': ['prettier'],
            \ 'css': ['prettier'],
            \ 'less': ['prettier'],
            \ 'scss': ['prettier'],
            \}





