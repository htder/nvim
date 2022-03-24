-- local colorscheme = "kanagawa"
--
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " not found!")
--   return
-- end

vim.g.material_style = "lighter"

require('material').setup({
  constrast = {
    sidebars = true,
    cursor_line = true,
    line_numbers = true,
  },
  italics = {
    comments = true,
    functions = true,
  },
  constrast_filetypes = {
    "terminal",
    "packer",
    "qf",
  },
  high_visibility = {
    lighter = true,
    darker = true,
  },
  disable = {
    borders = true,
    eob_lines = true,
  },
  lualine_style = 'stealth'
})

vim.cmd 'colorscheme material'
