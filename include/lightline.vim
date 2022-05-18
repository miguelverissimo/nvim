scriptencoding utf-8

let g:lightline = {
      \ 'inactive': {
      \   'left': [['filename', 'fileformat', 'modified']],
      \   'right': [['lineinfo', 'percent']],
      \ },
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['fugitive', 'filename'],
      \   ],
      \   'right': [
      \     ['lineinfo', 'percent'],
      \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'pomodoro'],
      \     ['config_outdated', 'devicons_filetype'],
      \   ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \   'pomodoro': '%{PomodoroStatus()}',
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'devicons_filetype': 'WebDevIconsGetFileTypeSymbol',
      \   'devicons_fileformat': 'WebDevIconsGetFileFormatSymbol',
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
      \ 'separator': { 'left': "", 'right': "" },
      \ 'subseparator': { 'left': "", 'right': "" },
      \ 'tabline_separator': { 'left': "", 'right': "" },
      \ 'tabline_subseparator': { 'left': "", 'right': "" }
      \ }

      " \ 'separator': { 'left': '', 'right': '' },
      " \ 'subseparator': { 'left': '', 'right': '' }
      " \ }

function! PomodoroStatus() abort
  if pomo#remaining_time() ==# '0'
    return ""
  else
    return "".pomo#remaining_time()
  endif
endfunction

function! LightlineModified()
  return &filetype =~# 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineFilename()
  let l:fname = fnamemodify(expand("%"), ":~:.")
  return  l:fname ==# '__Tagbar__' ? g:lightline.fname :
        \ l:fname =~# '__Gundo\|NERD_tree' ? '' :
        \ ('' !=# LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' !=# l:fname ? l:fname : '[No Name]') .
        \ ('' !=# LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightLineFilenameAbbreviated()
	let name = ""
	let subs = split(expand('%'), "/")
	let i = 1
	for s in subs
		let parent = name
		if  i == len(subs)
			let name = parent . '/' . s
		elseif i == 1
			let name = s
		else
			let name = parent . '/' . strpart(s, 0, 2)
		endif
		let i += 1
	endfor
  return name
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*FugitiveHead()')
    let l:branch = FugitiveHead()
    return l:branch !=# '' ? ' '.l:branch : ''
  endif
  return ''
endfunction

let g:lightline#ale#indicator_checking = ""
let g:lightline#ale#indicator_errors = " "
let g:lightline#ale#indicator_warnings = " "
let g:lightline#ale#indicator_infos = " "
let g:lightline#ale#indicator_ok = ""
