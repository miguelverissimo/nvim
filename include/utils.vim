" F10 list the highlight group under the cursor
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" W to write a file that requires sudo
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
