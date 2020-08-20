if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.local/share/nvim/plugged')

" Color schemes {
Plug 'miguelverissimo/tendinitis', { 'branch': 'foo' }
Plug 'nightsense/snow'
Plug 'nightsense/stellarized'
Plug 'farfanoide/vim-facebook'
Plug 'jonathanfilip/vim-lucius'
Plug 'chriskempson/base16-vim'
Plug 'rafi/awesome-vim-colorschemes'
" }

" NERDTree {
Plug 'scrooloose/nerdtree'
" }

" UI -- User interface additions {
" Fancy start page with recent files, etc
Plug 'mhinz/vim-startify'

" Show trailing whitespace in red {
Plug 'bronson/vim-trailing-whitespace'
" }

" Plugin to toggle, display and navigate marks {
Plug 'kshenoy/vim-signature'
" }

" Lightweight status line and friends {
Plug 'itchyny/lightline.vim'

" ALE indicator for the lightline vim plugin {
Plug 'maximbaz/lightline-ale'

Plug 'rmolin88/pomodoro.vim'
Plug 'ryanoasis/vim-devicons'
" }

" Visual guide for keybindings {
Plug 'hecal3/vim-leader-guide'
" }

" Editing -- Text manipulation helpers {
" (Un-)comment code
Plug 'tpope/vim-commentary'

" Multiple cursors
" Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'

" Visual context when bulk editing buffers
Plug 'pelodelfuego/vim-swoop'

" Select regions incrementally
Plug 'terryma/vim-expand-region'

" Automatically add 'end' when opening a block
Plug 'tpope/vim-endwise'

" Closes brackets (on <cr>)
Plug 'rstacruz/vim-closer'

" Move parameters around (delimited by a separator such as ,)
Plug 'machakann/vim-swap'

" Simplifies the transition between multiline and single-line code
Plug 'AndrewRadev/splitjoin.vim'

" :Join command
Plug 'sk1418/Join'

" quoting/parenthesizing made simple; e.g. ysiw) to wrap word in parens
Plug 'tpope/vim-surround'

" enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" Add emacs/bash/cocoa key bindings to vim, in insert and command-line modes.
Plug 'maxbrunsfeld/vim-emacs-bindings'

" Plugin to move lines and selections up and down
Plug 'matze/vim-move'

" A Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'

" Easy text exchange operator for Vim
Plug 'tommcdo/vim-exchange'
" }

" General -- Helpful generic tools with no dependencies {
" project configuration via 'projections'
Plug 'tpope/vim-projectionist'

" automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug 'tpope/vim-sleuth'

" easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" pairs of handy bracket mappings; e.g. [<Space> and ]<Space> add newlines before and after the cursor line
Plug 'tpope/vim-unimpaired'

" Vim sugar for the UNIX shell commands that need it the most; e.g. :Find, :Wall
Plug 'tpope/vim-eunuch'

" Make Vim persist editing state without fuss
Plug 'kopischke/vim-stay'

" Make Vim handle line and column numbers in file names with a minimum of fuss
Plug 'kopischke/vim-fetch'

" The ultimate undo history visualizer for VIM
Plug 'mbbill/undotree'

" Speed up Vim by updating folds only when called-for.
Plug 'Konfekt/FastFold'

" Sane buffer/window deletion.
Plug 'mhinz/vim-sayonara'

" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

" All the world's indeed a stage and we are merely players
Plug 'junegunn/limelight.vim'

" interact with tmux {
Plug 'benmills/vimux'
Plug 'keith/tmux.vim'
Plug 'edkolev/tmuxline.vim'
" }

" asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" Wrapper of some vim/neovim's :terminal functions
Plug 'kassio/neoterm'

" Tame the quickfix window
Plug 'romainl/vim-qf'

" Secure modeline: https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
Plug 'ciaranm/securemodelines'
" }

" Git -- Tools for using git and github {
" Awesome git wrapper
Plug 'tpope/vim-fugitive'

" Show git diff via Vim sign column.
Plug 'airblade/vim-gitgutter'

" Github extension for fugitive
Plug 'tpope/vim-rhubarb'
" }

" Autocomplete / Snippets {
if executable('yarn')
  " Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
  Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install()} }

  " View and search LSP symbols, tags in Vim
  Plug 'liuchengxu/vista.vim'
endif

Plug 'honza/vim-snippets'
" }

" Linting {
" Asynchronous Lint Engine
Plug 'w0rp/ale'
" }

" Navigation -- Fuzzy find, searching, etc {
" Modern performant generic finder and dispatcher for Vim and NeoVim
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" fzf
let g:fzf_command_prefix = 'FZF'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Helps you win at grep.
Plug 'mhinz/vim-grepper'

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'dyng/ctrlsf.vim'

" - for netrw current directory
Plug 'tpope/vim-vinegar'

" Improved incremental searching
Plug 'haya14busa/incsearch.vim'
" }

" Session management
Plug 'tpope/vim-obsession'

" FlyGrep
Plug 'wsdjeg/FlyGrep.vim'

" Language configuration {
" Testing {
Plug 'janko/vim-test'
" }

" C {
Plug 'arakashic/chromatica.nvim'
" }

" Ruby {
Plug 'keith/rspec.vim'
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'rake'] }
Plug 'tpope/vim-cucumber', { 'for': ['cucumber'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rake'] }
Plug 'tpope/vim-rake', { 'for': ['ruby', 'rake'] }
" }

" Go {
Plug 'fatih/vim-go'
" }

" Elixir {
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'
" }

" Markdown {
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }
" }

" JavaScript {
Plug 'pangloss/vim-javascript'
" }

" JSX {
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" }

" GraphQL {
Plug 'jparise/vim-graphql'
" }

" TypeScript {
Plug 'leafgarland/typescript-vim'
" }

" Vue {
Plug 'posva/vim-vue', { 'for': 'vue' }
" }

" HTML / CSS (including frameworks) {
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'gregsexton/MatchTag'
Plug 'iloginow/vim-stylus'
" }

" Elm {
Plug 'elmcast/elm-vim', { 'for': 'elm' }
" }

" Rust {
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" }

" Nix {
Plug 'LnL7/vim-nix'
" }

" Misc {
Plug 'PProvost/vim-ps1'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'chr4/nginx.vim'
Plug 'dag/vim-fish'
Plug 'hashivim/vim-terraform'
Plug 'kurayama/systemd-vim-syntax'
Plug 'peterhoeg/vim-qml'
Plug 'uarun/vim-protobuf'
Plug 'junegunn/vader.vim'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-haml'
Plug 'andrewstuart/vim-kubernetes'
Plug 'mustache/vim-mustache-handlebars'
" }

" Helm {
Plug 'towolf/vim-helm'
" }

" Text objects {
" allows you to configure % to match more than just single characters
Plug 'adelarsq/vim-matchit'

" Create your own text objects
Plug 'kana/vim-textobj-user'

" Underscore text-object for Vim
Plug 'lucapette/vim-textobj-underscore'

" custom text object for selecting ruby blocks
Plug 'nelstrom/vim-textobj-rubyblock'

" A convenient text object for last pasted text
Plug 'saaguero/vim-textobj-pastedtext'

"Text objects for functions
Plug 'kana/vim-textobj-function'

" A Vim text object for ERB blocks.
Plug 'whatyouhide/vim-textobj-erb'

" Vim plugin that provides additional text objects
Plug 'wellle/targets.vim'

" Text objects for foldings
Plug 'kana/vim-textobj-fold'
" }

" relative line numbers only on focused buffer {
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" }

" VimWiki: A Personal Wiki For Vim {
Plug 'vimwiki/vimwiki'
" }

" EditorConfig support
Plug 'editorconfig/editorconfig-vim'
" }

" Load user plugins
runtime! user/plug.vim

call plug#end()

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync | q
elseif exists('g:update_plugins') && g:update_plugins
  echo 'Updating plugins...'
  PlugUpdate --sync | q
endif

function! plug#reset_all_plugins(confirm)
  if a:confirm ==# 1
    call system('rm -rf ~/.local/share/nvim/plugged')
  else
    echoerr 'Refusing to delete plugins with confirmation, re-run the command with !'
  endif
endfunction

command! -bang ConfigResetAllPluginsReallyDoIt call plug#reset_all_plugins(<bang>0)
