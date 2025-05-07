if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
  let g:vimIsInTmux = 1
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
  let g:vimIsInTmux = 0
endif

" Use a nerdfont, the icons are as follow:
" fbf1 : ﯱ  f49b :   f878 :    f292 : 
" f599 :   fab1 : 缾 e7a2 :   f73f : 
" f848 :   23fb : ⏻  f007 :   f073 : 
" e0bc :   e0bd :   e0ba :   f12a : 

if g:vimIsInTmux == 1
  let g:tmuxline_preset = {
        \'a'    : '\ufbf1 #S',
        \'b'    : [ '\uf49b %R', '\uf878  #H'],
        \'win'  : '\uf292 #I(#W) #{?window_bell_flag,\uf559,}',
        \'cwin' : [ '\ufab1 #I', '\ue7a2 #W', '\uf73f #F #{?window_bell_flag,\uf599,}#{?window_zoomed_flag,\uf848,}' ],
        \'x'    : [ '\u23fb #(uptime | cut -d " " -f 1)',  '\uf007 #(whoami)' ],
        \'y'    : [ '\uf073 %a, %d/%m/%Y' ],
        \'z'    : [ '#{?client_prefix,\uf12a, }' ],
        \}
  let g:tmuxline_theme = {
        \'a'    : ['#1d3149', '#89a0bd'],
        \'b'    : ['#89a0bd', '#1d3149'],
        \'c'    : ['#89a0bd', '#1d3149'],
        \'win'  : ['#a7b0bb', '#394d67'],
        \'cwin' : ['#e1e0cf', '#3a6191'],
        \'x'    : ['#89a0bd', '#1d3149'],
        \'y'    : ['#1d3149', '#89a0bd'],
        \'z'    : ['#9e1126', '#1d3149'],
        \'bg'   : ['#e1e0cf', '#282828'],
        \}
  let g:tmuxline_separators = {
        \ 'left' : "\ue0bc",
        \ 'left_alt': "\ue0bd",
        \ 'right' : "\ue0ba",
        \ 'right_alt' : "\ue0bd",
        \ 'space' : ' '
        \}
endif
