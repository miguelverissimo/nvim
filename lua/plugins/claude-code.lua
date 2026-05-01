return {
  "greggh/claude-code.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local cc = require("claude-code")
    cc.setup({
      window = {
        position = "vertical botright",
        split_ratio = 0.4,
      },
      git = {
        use_git_root = true,
      },
      keymaps = {
        toggle = {
          normal = "<leader>cc",
          terminal = "<leader>cc",
          variants = {
            continue = "<leader>cC",
            verbose = "<leader>cV",
          },
        },
        window_navigation = false,
        scrolling = false,
      },
    })

    local function ensure_visible()
      local id = cc.claude_code.current_instance
      local bufnr = id and cc.claude_code.instances[id]
      local visible = bufnr
        and vim.api.nvim_buf_is_valid(bufnr)
        and #vim.fn.win_findbuf(bufnr) > 0
      if not visible then
        cc.toggle()
      end
    end

    local function active_job_id()
      local id = cc.claude_code.current_instance
      local bufnr = id and cc.claude_code.instances[id]
      if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
        return nil
      end
      return vim.b[bufnr].terminal_job_id
    end

    local function visual_selection()
      local save = vim.fn.getreg("z")
      local save_type = vim.fn.getregtype("z")
      vim.cmd('noautocmd silent normal! gv"zy')
      local sel = vim.fn.getreg("z")
      vim.fn.setreg("z", save, save_type)
      return sel
    end

    local function send_prompt(prefix, body)
      if body == nil or body == "" then
        vim.notify("claude: nothing to send", vim.log.levels.WARN)
        return
      end
      ensure_visible()
      vim.defer_fn(function()
        local job = active_job_id()
        if not job then
          vim.notify("claude: terminal not ready", vim.log.levels.WARN)
          return
        end
        vim.fn.chansend(job, prefix .. ":\n\n" .. body .. "\n")
      end, 80)
    end

    local prompts = {
      Explain  = "Explain this code",
      Fix      = "Find and fix any bugs in this code",
      Refactor = "Refactor this code for clarity, keeping behavior identical",
      Test     = "Write tests for this code",
      Doc      = "Add documentation comments to this code",
      Rename   = "Suggest better names for the identifiers in this code",
      Optimize = "Optimize this code for performance, keeping behavior identical",
      Debug    = "Help debug this code; ask for any context you need",
      Analyze  = "Analyze this code: complexity, edge cases, risks",
    }

    for name, prefix in pairs(prompts) do
      vim.api.nvim_create_user_command("Claude" .. name, function(opts)
        local body = opts.range > 0 and visual_selection() or vim.api.nvim_get_current_line()
        send_prompt(prefix, body)
      end, { range = true })
    end
  end,
}
