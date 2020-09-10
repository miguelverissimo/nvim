" Full redraw fixing syntax highlight bugs
nnoremap <silent> <M-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr>:redraw!<cr>

" Flygrep with <SPC>ss
nnoremap <leader>ss :FlyGrep<cr>

"" Fuzzy file browsing
nnoremap <silent> <C-p> :FZFFiles<CR>
nnoremap <silent> <M-f> :Clap files --hidden<CR>

""" Tab navigation
map <C-t><up> :tabright<cr>
map <C-t><k> :tabright<cr>
map <C-t><down> :tableft<cr>
map <C-t><j> :tableft<cr>
map <C-t><left> :tabprevious<cr>
map <C-t><h> :tabprevious<cr>
map <C-t><right> :tabnext<cr>
map <C-t><l> :tabnext<cr>

""" Copy to system clipboard
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

""" Quicker splits
nnoremap <silent> <leader>vv :vsplit<cr>
nnoremap <silent> <leader>vh :split<cr>

""" Navigate splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"" ALE
nmap <silent> <M-p> <Plug>(ale_previous_wrap)
nmap <silent> <M-n> <Plug>(ale_next_wrap)

" Eanble completion with tab/shift-tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Extra commentary mappings
xmap <c-_>  <Plug>Commentary
omap <c-_>  <Plug>Commentary
nmap <c-_>  <Plug>CommentaryLine

" Y to copy till end of line
nnoremap Y y$

" Indent/dedent using tab/shift-tab or >/<
vnoremap > >gv
vnoremap < <gv

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Save with enter
function! keyboard#should_save_on_enter()
  return bufname('%') !=# 'swoopBuf' && empty(&buftype)
endfunction
nnoremap <silent> <expr> <CR> keyboard#should_save_on_enter() ? ':call SaveIfUnsaved()<CR>' : '<CR>'

" Emmet
let g:user_emmet_leader_key='<leader>e'
let g:user_emmet_mode='nv'              " only enable normal and visual mode functions

" Escape to clear search
nnoremap <silent> <esc> :noh<cr>

" Close and delete buffer
nnoremap <silent> <M-q> :Sayonara<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)

" Leader is <Space>
let g:mapleader=' '
let g:maplocalleader = ','

" Disable search highlight
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

let g:lmap =  {}

" Disable plugin mappings
let g:swoopUseDefaultKeyMap = 0
let g:gitgutter_map_keys = 1

function! s:leaderGuideDisplay()
  let g:leaderGuide#displayname =
        \ substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
  let g:leaderGuide#displayname =
        \ substitute(g:leaderGuide#displayname, '^<Plug>', '', '')
  let g:leaderGuide#displayname =
        \ substitute(g:leaderGuide#displayname, '^:', '', '')
endfunction
let g:leaderGuide_displayfunc = [function('s:leaderGuideDisplay')]

call leaderGuide#register_prefix_descriptions('<Space>', 'g:lmap')
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

let g:lmap[' '] = { 'name': 'General' }
nnoremap <leader><leader>c :FZFCommands<CR>

let g:lmap.t = { 'name': 'Testing' }
nnoremap <silent> <leader>tt :TestNearest<CR>
nnoremap <silent> <leader>t. :TestLast<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>

let g:lmap.f = { 'name': 'Files' }
nnoremap <silent> <leader>ff :FZFFiles<CR>
nnoremap <silent> <leader>fo :FZFBuffers<CR>
nnoremap <silent> <leader>fm :FZFHistory<CR>
nnoremap <silent> <Plug>(open-alternate) <c-^>
nmap     <silent> <leader>f. <Plug>(open-alternate)

let g:lmap.h = { 'name': 'Hunks' }
let g:lmap.g = { 'name': 'Git' }
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :FZFCommits<CR>
nnoremap <silent> <leader>gk :FZFBCommits<CR>
nnoremap <silent> <leader>gb :Gblame<CR>

let g:lmap.s = { 'name': 'Search' }
nnoremap <silent> <leader>sg :Grepper<CR>
let g:lmap.s.f = [':FZFRg ', 'FZFRg']
nnoremap <silent> <leader>st :FZFTags<CR>
nnoremap <silent> <leader>sl :FZFLines<CR>
let g:lmap.s.s = { 'name': 'FlyGrep' }

let g:lmap.y = { 'name': 'Cscope' }
let g:lmap.y.s = ['cs find s <cword>',                                            'Cscope Symbol']
let g:lmap.y.g = ['cs find g <cword>',                                            'Cscope Definition']
let g:lmap.y.c = ['cs find c <cword>',                                            'Cscope Callers']
let g:lmap.y.d = ['cs find d <cword>',                                            'Cscope Callees']
let g:lmap.y.a = ['cs find a <cword>',                                            'Cscope Assignments']
let g:lmap.y.z = ['!sh -xc ''starscope -e cscope -e ctags -x "*.go" -x "*.js"''', 'Cscope Build Database']
let g:lmap.y.o = ['cs add cscope.out',                                            'Cscope Open Database']

let g:lmap.e = { 'name': 'Emmet (HTML toolkit)' }

let g:lmap.l = { 'name': 'Language Server' }
let g:lmap.l.k =  [':call CocAction("doHover")', 'Hover']
let g:lmap.l.s =  [':Vista finder coc', 'Symbols']
let g:lmap.l.t =  [':Vista coc', 'Tag Bar']
let g:lmap.l.ct = [':Vista!', 'Close Tag Bar']

let g:lmap.n = { 'name': 'NERDTree' }
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap \ :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap \| :NERDTreeFind<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
let g:NERDTreeHijackNetrw=0
augroup mv_nerdtree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

let g:lmap.w = { 'name': 'VimWiki' }

let g:lmap.v = { 'name': 'Splits' }
let g:lmap.v.v = ['vsplit', 'Vertical Split']
let g:lmap.v.h = ['split', 'Horizontal Split']


""" CoC
let g:lmap.c = { 'name': 'CoC' }
let g:lmap.c.c = { 'name': 'List' }
" Show all diagnostics.
let g:lmap.c.c.a = ['CocList diagnostics', 'Diagnostics']
" Manage extensions.
let g:lmap.c.c.e = ['CocList extensions', 'Extensions']
" Show commands.
let g:lmap.c.c.c = ['CocList commands', 'Commands']
" Find symbol of current document.
let g:lmap.c.c.o = ['CocList outline', 'Outline']
" Search workspace symbols.
let g:lmap.c.c.s = ['CocList -I symbols', 'Workspace symbols']
" Do default action for next item.
let g:lmap.c.c.j = ['CocNext', 'Next item (default action)']
" Do default action for previous item.
let g:lmap.c.c.k = ['CocPrev', 'Previous item (default action)']
" Resume latest coc list.
let g:lmap.c.c.p = ['CocListResume', 'Resume list']

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
let g:lmap.c.a = ['call feedkeys("\<Plug>(coc-codeaction)")', 'Code Action']
vmap <silent> <leader>ca <Plug>(coc-codeaction-selected)
xmap <silent> <leader>ca <Plug>(coc-codeaction-selected)

" Format selected
let g:lmap.c['='] = ['call feedkeys("\<Plug>(coc-format)")', 'Format']
vmap <silent> <leader>c= <Plug>(coc-format-selected)

" Rename Symbol
let g:lmap.c.r = ['call feedkeys("\<Plug>(coc-rename)")', 'Rename']

" Fix current selection
let g:lmap.c.f = ['call feedkeys("\<Plug>(coc-fix-current)")', 'Fix Current']


" Goto
let g:lmap.c.g = { 'name': 'Go To' }
" Goto definition
let g:lmap.c.g.d = ['call feedkeys("\<Plug>(coc-definition)")', 'Definition']
nmap <silent> gd <Plug>(coc-definition)

" Goto type definition
let g:lmap.c.g.y = ['call feedkeys("\<Plug>(coc-type-definition)")', 'Type Definition']
nmap <silent> gy <Plug>(coc-type-definition)

" Goto type definition
let g:lmap.c.g.i = ['call feedkeys("\<Plug>(coc-implementation)")', 'Implementation']
nmap <silent> gi <Plug>(coc-implementation)

" Goto type definition
let g:lmap.c.g.r = ['call feedkeys("\<Plug>(coc-references)")', 'References (callers)']
nmap <silent> gr <Plug>(coc-references)

if executable('yarn')
  imap <C-j> <Plug>(coc-snippets-expand-jump)
  vmap <C-j> <Plug>(coc-snippets-select)
  let g:coc_snippet_next = '<c-j>'
  let g:coc_snippet_prev = '<c-k>'
  inoremap <silent><expr> <M-space> coc#refresh()
endif

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <F2> to trigger completion.
inoremap <silent><expr> <F2> coc#refresh()

" Use `[v` and `]v` to navigate diagnostics
nmap <silent> [v <Plug>(coc-diagnostic-prev)
nmap <silent> ]v <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Remap C-I to be C-I
nnoremap <C-I> <C-I>

" Grepper
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
