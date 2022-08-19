local M = {}

M.config = function()
  table.insert(
    lvim.plugins,
    {
    'wfxr/minimap.vim',
    run = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 0")
      vim.cmd("let g:minimap_auto_start_win_enter = 0")
    end,
  })
end

-- keybindings
M.keybindings = function()
  vim.api.nvim_set_keymap(
    'n',
    '<leader>mm',
    '<cmd>MinimapToggle<cr>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<leader>mc',
    '<cmd>MinimapClose<cr>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<leader>mr',
    '<cmd>MinimapRefresh<cr>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    'n',
    '<leader>mu',
    '<cmd>MinimapUpdateHighlight<cr>',
    { noremap = true, silent = true }
  )
end

return M
