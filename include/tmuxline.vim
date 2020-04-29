if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
  let g:vimIsInTmux = 1
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
  let g:vimIsInTmux = 0
endif

if g:vimIsInTmux == 1
  let g:tmuxline_preset = {
        \'a'    : '#S',
        \'b'    : '#H #{prefix_highlight}',
        \'win'  : [ '#I', '#W' ],
        \'cwin' : [ '#I', '#W', '#F' ],
        \'y'    : ['#(uptime | cut -d " " -f 1,2,3)',  '#(whoami)' ],
        \'z'    : [ ' %a, %d/%m/%Y' ],
        \}
  let g:tmuxline_separators = {
        \ 'left' : "",
        \ 'left_alt': "",
        \ 'right' : "",
        \ 'right_alt' : "",
        \ 'space' : ' '}
endif
