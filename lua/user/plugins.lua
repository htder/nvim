local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  -- General
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "numToStr/Comment.nvim" }  -- easy comments
  use { "nvim-lua/plenary.nvim" }
  use { "Olical/conjure" } -- clojure support

  -- Colorschemes
  use { "rebelot/kanagawa.nvim" }
  use { "folke/tokyonight.nvim" }
  use { "projekt0n/github-nvim-theme" }
  use { "marko-cerovac/material.nvim" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }  -- fuzzy finder
  use { "kyazdani42/nvim-web-devicons" }  -- icons for telescope
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }  -- treesitter + comments
  use { "windwp/nvim-ts-autotag" }  -- using treesitter to autoclose and autorename html tags
  use { "windwp/nvim-autopairs" }  -- using treesitter to complete pairs
  use { "p00f/nvim-ts-rainbow" }  -- rainbow parenteses using treesitter

  -- Toggle Terminal
  use { "akinsho/toggleterm.nvim" }
  use { "lewis6991/impatient.nvim" }

    -- cmp plugins
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "hrsh7th/cmp-cmdline" } -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  -- snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/nvim-lsp-installer" } -- simple to use language server installer
  use { "tamago324/nlsp-settings.nvim"}
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "mfussenegger/nvim-jdtls" } -- java support

  -- Git
  use { "lewis6991/gitsigns.nvim" }

  -- Bufferline
  use { "akinsho/bufferline.nvim" }

  -- Lualine
  use { "nvim-lualine/lualine.nvim" }

end)
