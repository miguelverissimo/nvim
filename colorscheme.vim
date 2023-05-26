if !exists('g:colors_name')
  syntax enable
  let base16colorspace=256

  if (has("termguicolors"))
    set termguicolors
  endif

  set background=dark

  " colorscheme iceberg
  " let g:lightline.colorscheme = 'iceberg'

  " let g:lightline.colorscheme = 'elixizy'
  " colorscheme synthwave84

  " let g:nord_italic = 1
  " colorscheme nord
  " let g:lightline.colorscheme = 'nord'

  " let g:two_firewatch_italics=1
  " colorscheme two-firewatch

  " let g:seoul256_background = 234
  " colorscheme seoul256

  " let g:oceanic_next_terminal_bold = 1
  " let g:oceanic_next_terminal_italic = 1
  " colorscheme OceanicNext

  " colorscheme dogrun
  " let g:lightline.colorscheme = 'dogrun'

  " colorscheme stellarized

  " colorscheme tender
  " let g:lightline.colorscheme = 'tender'

  " We use a colorscheme from the `tendinitis` collection
  " colorscheme elixizy
  " let g:lightline.colorscheme = 'elixizy'

  " colorscheme quarantine
  " let g:lightline.colorscheme = 'quarantine'

  " colorscheme tendinitis
  " let g:lightline.colorscheme = 'tendinitis'

  " let g:hybrid_reduced_contrast = 1
  " colorscheme hybrid

  " colorscheme hybrid_reverse

  " let g:oceanic_material_background = 'ocean'
  " colorscheme oceanic_material

  " colorscheme snow
  " let g:lightline.colorscheme = 'snow_dark'

  " colorscheme zenburn
  " colorscheme dracula_pro_buffy
  " colorscheme deep-space
  " colorscheme night-owl
  " let g:lightline.colorscheme = 'night-owl'

  " colorscheme hybrid

  "  let g:everforest_background = 'hard'
  " " For better performance
  " " let g:everforest_better_performance = 1
  " let g:lightline.colorscheme = 'everforest'
  " colorscheme everforest

  let g:lightline.colorscheme = 'embark'
  colorscheme embark

  " hi CocSearch guifg=#ffffff guibg=#34495e
  " hi CocMenuSel guifg=#ffffff guibg=#e74c3c
endif
