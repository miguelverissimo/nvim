" Maintainer: Miguel Verissimo <https://github.com/miguelverissimo>
" Version:    0.0.1

scriptencoding utf-8

" Setup user preferences
if !isdirectory(expand('<sfile>:h') . '/user')
  silent! execute '!cp -a ' . expand('<sfile>:h') . '/user.defaults ' . expand('<sfile>:h') . '/user'
endif

runtime user/before.vim
runtime update.vim " Auto-update
runtime plug.vim
runtime! lang/*.vim
runtime! include/*.vim
runtime keyboard.vim
runtime user/after.vim
runtime colorscheme.vim

" Allow project specific configuration
set exrc
set secure
