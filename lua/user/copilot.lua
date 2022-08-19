local M = {}

M.config = function()
  table.insert(
    lvim.plugins,
    { "github/copilot.vim" }
  )
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_tab_fallback = ""
  local cmp = require "cmp"

  lvim.builtin.cmp.mapping["<C-j>"] = function(fallback)
    cmp.mapping.abort()
    local copilot_keys = vim.fn["copilot#Accept"]()
    if copilot_keys ~= "" then
      vim.api.nvim_feedkeys(copilot_keys, "i", true)
    else
      fallback()
    end
  end
end

return M
