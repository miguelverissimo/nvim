return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "ruby", 
        "lua", 
        "vim", 
        "elixir", 
        "javascript", 
        "typescript", 
        "html", 
        "css", 
        "dockerfile", 
        "glimmer_javascript", 
        "glimmer_typescript", 
        "go", 
        "rust",
        "markdown",
        "json",
        "nix",
        "toml",
        "yaml"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enabled = true },
    })
  end
}
