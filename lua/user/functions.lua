local M = {}

-- M.preserve = function(arguments)
--   local farguments = string.format("keepjumps keeppatterns execute %q", arguments)
--   -- local original_cursor = vim.fn.winsaveview()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   vim.api.nvim_command(farguments)
--   local lastline = vim.fn.line("$")
--   -- vim.fn.winrestview(original_cursor)
--   if line > lastline then
--     line = lastline
--   end
--   vim.api.nvim_win_set_cursor({ 0 }, { line, col })
-- end

M.rubocop = function()
  vim.api.nvim_exec(
    [[
    ]],
    true)
end

return M
