local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer not found")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua", requires = { 'nvim-tree/nvim-web-devicons' } }
	use { "moll/vim-bbye" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "goolord/alpha-nvim" }
	use { "folke/which-key.nvim" }

	-- Colorschemes
  use { "sainnhe/everforest" }
  use { "marko-cerovac/material.nvim" }

  -- Session management
  use { "tpope/vim-obsession" }

  -- Testing
  -- use { "janko/vim-test" }
  use { "klen/nvim-test" }

  -- Comments
  use { "tpope/vim-commentary" }

  -- Multiple cursors ??????
  use { "mg979/vim-visual-multi" }

  -- Close brackets 
  use { "rstacruz/vim-closer" }

  -- :Join command
  use { "sk1418/Join" }

  -- Quoting/parenthesizing made simple; e.g. ysiw) to wrap word in parens
  use { "tpope/vim-surround" }

  -- Move lines and selections
  use { "matze/vim-move" }

  -- interact with tmux ???????????
  use { "benmills/vimux" }
  use { "keith/tmux.vim" }
  use { "edkolev/tmuxline.vim" }

  -- Ruby
  use { "keith/rspec.vim" }
  use { "tpope/vim-bundler", ft = {"ruby", "rake"} }
  use { "tpope/vim-cucumber", ft = {"cucumber"} }
  use { "tpope/vim-rails", ft = {"ruby", "rake"} }
  use { "tpope/vim-rake", ft = {"ruby", "rake"} }
  use { "tpope/vim-endwise" }

  -- Elixir 
  use { "elixir-editors/vim-elixir" }
  use { "slashmili/alchemist.vim" }
  use { "mhinz/vim-mix-format" }

  -- Rust
  use { "rust-lang/rust.vim", ft = {"rust"} }

  -- Ember
  use { "mustache/vim-mustache-handlebars" }
  use { "joukevandermaas/vim-ember-hbs" }
  use { "AndrewRadev/ember_tools.vim" }

  -- EditorConfig support
  use { "editorconfig/editorconfig-vim" }

	-- Cmp 
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
	use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-nvim-lua" }

	-- Snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

	-- LSP
	use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" } -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" }

	-- Telescope
	use { "nvim-telescope/telescope.nvim" }

  -- FZF
  use { "junegunn/fzf", rtp =  "~/.fzf", run = { "./install --all" } }
  use { "junegunn/fzf.vim" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = { "make" } }

	-- Treesitter
	use { "nvim-treesitter/nvim-treesitter" }

	-- Git
	use { "lewis6991/gitsigns.nvim" }

  -- Buffer management ????????????????
  use { "kazhala/close-buffers.nvim" }

  -- Enable repeating supported plugin maps with '.'
  use { "tpope/vim-repeat" }

  -- Colors!
  use { "norcalli/nvim-colorizer.lua" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
