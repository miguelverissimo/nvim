scriptencoding utf-8

let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], ['fugitive', 'filename']],
      \   'right': [
      \     ['lineinfo'],
      \     ['percent'],
      \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
      \     ['config_outdated'],
      \   ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \   'config_outdated': 'update#status',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_infos': 'right',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \   'config_outdated': 'warning',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
  return &filetype =~# 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineFilename()
  let l:fname = expand('%')
  return  l:fname ==# '__Tagbar__' ? g:lightline.fname :
        \ l:fname =~# '__Gundo\|NERD_tree' ? '' :
        \ ('' !=# LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' !=# l:fname ? l:fname : '[No Name]') .
        \ ('' !=# LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
  if exists('*fugitive#head')
    let l:branch = fugitive#head()
    return l:branch !=# '' ? ' '.l:branch : ''
  endif
  return ''
endfunction

let g:lightline#ale#indicator_checking = ""
let g:lightline#ale#indicator_errors = " "
let g:lightline#ale#indicator_warnings = " "
let g:lightline#ale#indicator_infos = " "
let g:lightline#ale#indicator_ok = ""
