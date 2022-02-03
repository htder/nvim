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
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "rebelot/kanagawa.nvim"  -- Colorscheme
  use "numToStr/Comment.nvim"  -- easy comments
  use "nvim-lua/plenary.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"  -- fuzzy finder
  use "kyazdani42/nvim-web-devicons"  -- icons for telescope

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  } 
  use 'JoosepAlviste/nvim-ts-context-commentstring'  -- treesitter + comments
  use 'windwp/nvim-ts-autotag'  -- using treesitter to autoclose and autorename html tags
  use 'windwp/nvim-autopairs'  -- using treesitter to complete pairs
  use 'p00f/nvim-ts-rainbow'  -- rainbow parenteses using treesitter

  -- Toggle Terminal
  use "akinsho/toggleterm.nvim"

end)
