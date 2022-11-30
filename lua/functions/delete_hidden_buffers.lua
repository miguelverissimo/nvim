vim.api.nvim_create_user_command(
  'DeleteHiddenBuffers',
  function()
    vim.cmd([[
      let tpbl = []
      let closed = 0
      call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
      for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        if getbufvar(buf, '&mod') == 0
          silent execute 'bwipeout' buf
          let closed += 1
        endif
      endfor
      let msg = "Closed ".closed." hidden buffers"
      lua vim.notify(vim.api.nvim_eval("msg"))
    ]])
  end,
  { nargs = 0 }
)
