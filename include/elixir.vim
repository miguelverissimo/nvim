""" Format elixir files with mix on save
let g:mix_format_on_save = 1

" Elixir language server setup (using ale):
"
" $ git clone git@github.com:elixir-lsp/elixir-ls.git
" $ cd elixir-ls && mkdir rel
" $ mix deps.get && mix compile
" $ mix elixir_ls.release -o rel
" $ ln -s $(pwd)/rel $HOME/elixir-ls
let g:ale_elixir_elixir_ls_release = '$HOME/elixir-ls'

let g:ale_linters = {
\   'elixir': ['elixir-ls'],
\}

let g:ale_fixers = {
\  'elixir': ['mix_format'],
\}
