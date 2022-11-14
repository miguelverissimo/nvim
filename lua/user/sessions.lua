vim.cmd([[
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

function! s:cd_to_project_root(path) abort
  let dir = fnamemodify(a:path, ':p:h')
  let root = finddir('.git', dir .';')
  if !empty(root)
    execute 'lcd' fnameescape(fnamemodify(root, ':h'))
    return 1
  endif
  return 0
endfunction

function! RestoreSess()
  call s:cd_to_project_root(getcwd())
  if filereadable('.git/.session.vim')
    execute 'so .git/.session.vim'
    execute 'Obsession .git/.session.vim'
  endif
endfunction

autocmd VimEnter * nested if !argc() | call RestoreSess() | endif
]])
