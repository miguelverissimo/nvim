if empty($TMUX)
  let g:test#strategy = 'neoterm'
else
  let g:test#strategy = 'vimux'
endif

" Do not run tests from binstubs
let test#ruby#use_binstubs = 0
let test#ruby#use_spring_binstub = 0
