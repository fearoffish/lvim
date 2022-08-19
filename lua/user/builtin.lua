local M = {}

M.config = function()
  -- Dashboard
  -- =========================================
  -- lvim.builtin.alpha.active = true
  -- lvim.builtin.alpha.custom_section["m"] = {
  --   description = { "  Marks              " },
  --   command = "Telescope marks",
  -- }

  -- Telescope
  -- =========================================
  lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  lvim.builtin.telescope.defaults.file_ignore_patterns = { "vendor/*" }


  -- Lualine
  -- =========================================
  lvim.builtin.lualine.sections.lualine_a = { "mode" }

  require('lspconfig').solargraph.setup {
    cmd = { "solargraph", "stdio" }
  }
end

return M
