local M = {}

M.config = function()
  require "lspconfig".nix.setup {
    cmd = { "rnix-lsp", },
    filetypes = { "nix" },
  }
end

return M
