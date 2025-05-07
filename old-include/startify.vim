scriptencoding utf-8

let g:startify_enable_special = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': [   'Sessions']        },
  \ { 'type': 'dir',       'header': [   'MRU ' . getcwd()] },
  \ { 'type': 'files',     'header': [   'MRU']             },
  \ { 'type': 'bookmarks', 'header': [   'Bookmarks']       },
  \ { 'type': 'commands',  'header': [   'Commands']        },
  \ ]

let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]

let s:version = split(execute('version'), '\n')[0]

let g:startify_custom_header = [
  \ '                 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
  \ '                 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
  \ '                 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
  \ '                 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  \ '                 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
  \ '                 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
  \ '',
  \ '         config by Miguel Verissimo <https://github.com/miguelverissimo>',
  \ printf('       Neovim Version: %-15s %35s', s:version, '(run :version for more details)'),
  \ ]

