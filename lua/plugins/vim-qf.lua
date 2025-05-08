return {
  "romainl/vim-qf",

  config = function()
    vim.cmd([[
      let g:qf_mapping_ack_style = 1
    ]])
  end,
}
