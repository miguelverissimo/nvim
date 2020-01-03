""" remove trailing whitspace on save
autocmd BufWritePre * %s/\s\+$//e
