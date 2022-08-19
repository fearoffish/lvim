local M = {}

M.config = function()
  table.insert(
    lvim.plugins,
    { "beauwilliams/focus.nvim", config = function() require("focus").setup({ excluded_filetypes = { "toggleterm", "TelescopePrompt" }, excluded_buftypes = { "help", "TelescopePrompt" }, treewidth = 30, compatible_filetrees = { "NvimTree" } }) end }
  )
end

-- keybindings
M.keybindings = function()
  vim.api.nvim_set_keymap('n', '<leader>FF', ":lua require('focus').split_nicely()<CR>", { silent = true })
end

return M
