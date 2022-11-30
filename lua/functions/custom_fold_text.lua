vim.cmd([[
  function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1

    return ' + ' . foldedlinecount . ' --- ' . line
  endfunction

   set foldtext=MyFoldText()
   set fillchars=fold:-
]])
