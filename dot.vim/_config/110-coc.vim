
if empty(globpath(&rtp, 'autoload/coc.vim'))
  finish
endif



let g:coc_global_extensions = [
  \ 'coc-explorer',
  \ 'coc-fzf-preview',
  \ 'coc-snippets',
  \ 'coc-sh',
  \ 'coc-yaml',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-html-css-support',
  \ ]
" \ 'coc-sql',
" \ 'coc-tabnine',
" \ 'coc-solargraph'
" \ 'coc-prettier',
" \ 'coc-tsserver',
" \ 'coc-tslint-plugin',
" \ 'coc-eslint',
" \ 'coc-vetur',
" \ 'coc-jest',
" \ 'coc-git',
" \ 'coc-markdownlint',
" \ 'coc-marketplace',
" \ 'coc-python',
" \ 'coc-react-refactor',
" \ 'coc-rust-analyzer',
" \ 'coc-spell-checker',
" \ 'coc-vimlsp',
" \ 'coc-word',

let g:coc_snippet_next = '<tab>'
" let g:fzf_preview_custom_processes = {'open-file':{}}

let g:fzf_preview_custom_processes = {
  \ 'open-file': {
    \ 'ctrl-o': 'OpenFileCtrlO',
    \ 'ctrl-q': 'OpenFileCtrlQ',
    \ 'ctrl-t': 'OpenFileCtrlT',
    \ 'ctrl-v': 'OpenFileCtrlV',
    \ 'ctrl-s': 'OpenFileCtrlX',
    \ 'enter': 'OpenFileEnter'
    \}
  \}

augroup CocVimGroup
  autocmd!
  autocmd FileType * call s:configure_lsp()
augroup END

function! s:configure_lsp() abort
  let l:coc_filetyps = [
        \ 'php',
        \ 'bash',
        \ 'yaml',
        \ 'json',
        \ 'html',
        \ 'scss',
        \ 'css',
        \ ]
  " let l:coc_filetyps = [
        " \ 'Dockerfile',
        " \ 'bash',
        " \ 'css',
        " \ 'scss',
        " \ 'html',
        " \ 'javascript',
        " \ 'json',
        " \ 'markdown',
        " \ 'python',
        " \ 'typescript',
        " \ 'vue',
        " \ 'yaml'
        " \ ]
  " if match(l:coc_filetyps, &filetype) == -1
    " return
  " endif


  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=number

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  nmap <buffer><C-]> <Plug>(coc-definition)
  nmap <buffer><silent> gd <Plug>(coc-definition)
  nmap <buffer><silent> gt <Plug>(coc-type-definition)
  nmap <buffer><silent> gi <Plug>(coc-implementation)
  nmap <buffer><silent> gr <Plug>(coc-references)

  nmap <buffer><leader>R   <Plug>(coc-rename)

  " Diagnostic
  nmap <buffer><silent> ]g <Plug>(coc-diagnostic-next)
  nmap <buffer><silent> [g <Plug>(coc-diagnostic-prev)

  " coc-explorer
  nnoremap <buffer><leader>e  :CocCommand explorer --quit-on-open<CR>

  " coc-fzf-preview
  nmap ff [fzf-p]
  xmap ff [fzf-p]

  nnoremap <silent> [fzf-p]f     :<C-u>CocCommand fzf-preview.FromResources buffer project<CR>
  nnoremap <silent> [fzf-p]g     :<C-u>CocCommand fzf-preview.FromResources git<CR>
  nnoremap <silent> [fzf-p]m     :<C-u>CocCommand fzf-preview.FromResources mru old<CR>
  nnoremap <silent> [fzf-p]D     :<C-u>CocCommand fzf-preview.FromResources directory<CR>
  nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
  nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>

  nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
  nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>

  nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
  nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>

  nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>

  nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
  nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
  nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
  nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
  nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

endfunction
