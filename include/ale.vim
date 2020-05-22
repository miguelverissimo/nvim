scriptencoding utf-8

let g:ale_go_langserver_executable = 'gopls'
let g:ale_elixir_elixir_ls_release = '$HOME/elixir-ls'

let g:ale_linters_explicit = 1

let g:ale_linters = {
\   'go':         ['golangci-lint', 'gopls'],
\   'typescript': ['tsserver', 'typecheck'],
\   'javascript': ['eslint'],
\   'ruby':       ['rubocop', 'standardrb', 'ruby'],
\   'elixir':     ['elixir-ls'],
\}

let g:ale_fixers = {
\   'javascript': ['importjs', 'prettier_eslint', 'prettier-eslint', 'trim_whitespace'],
\   'elixir':     ['mix_format'],
\   'ruby':       ['rubocop', 'standardrb'],
\}


" This gets around typecheck errors for types defined in other files in the
" same package
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = '--fast'

" Disable completion, we use CoC for that
let g:ale_completion_enabled = 0

noremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <leader>af :ALEFix<cr>
noremap <Leader>ar :ALEFindReferences<CR>

"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" ---------------

let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_set_balloons = 0

let g:ale_echo_cursor = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '  '

highlight link ALEVirtualTextError ErrorMsg
highlight link ALEVirtualTextStyleError ALEVirtualTextError
highlight link ALEVirtualTextWarning WarningMsg
highlight link ALEVirtualTextInfo ALEVirtualTextWarning
highlight link ALEVirtualTextStyleWarning ALEVirtualTextWarning

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_open_list = 0
let g:ale_sign_column_always = 1

" let g:ale_sign_error = '✖︎'
" let g:ale_sign_warning = '➤'
" let g:ale_sign_info = '➟'
let g:ale_sign_error = ""
let g:ale_sign_warning = ""
let g:ale_sign_info = ""
