-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "onedarker"
vim.o.guifont = "FiraCode Nerd Font Mono:h17"
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 10

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.dap.active = true
lvim.builtin.dap.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true
-- LSP configuration
lvim.lsp.diagnostics.virtual_text = false
-- lvim.lsp.buffer_mappings.normal_mode["gr"] = {  "<cmd>Telescope lsp_references<cr>", "Go to Reference" }
-- lvim.lsp.buffer_mappings.normal_mode["gd"] = {  "<cmd>Telescope lsp_definitions<cr>", "Go to Definition" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- Additional Plugins
lvim.plugins = {
  { "stevearc/dressing.nvim" },
  { 'tpope/vim-surround' },
  { "hashivim/vim-terraform" },
  { "p00f/nvim-ts-rainbow" },
  { 'rafi/awesome-vim-colorschemes' },
  { 'junegunn/vim-easy-align' },
  { 'tpope/vim-bundler' },
  {
    "vim-scripts/ReplaceWithRegister",
    event = "BufEnter",
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  -- lsp progress indicator
  {
    'j-hui/fidget.nvim',
    config = function()
      require("fidget").setup()
    end,
  },
  -- smooth scrolling
  {
    'declancm/cinnamon.nvim',
    config = function()
      require('cinnamon').setup()
    end
  },
  {
    'sindrets/winshift.nvim',
    config = function()
      require("winshift").setup({
        highlight_moving_win = true, -- Highlight the window being moved
        focused_hl_group = "Visual", -- The highlight group used for the moving window
        moving_win_options = {
          -- These are local options applied to the moving window while it's
          -- being moved. They are unset when you leave Win-Move mode.
          wrap = false,
          cursorline = false,
          cursorcolumn = false,
          colorcolumn = "",
        },
        -- The window picker is used to select a window while swapping windows with
        -- ':WinShift swap'.
        -- A string of chars used as identifiers by the window picker.
        window_picker_chars = "ASDFGHJKL",
        window_picker_ignore = {
          -- This table allows you to indicate to the window picker that a window
          -- should be ignored if its buffer matches any of the following criteria.
          filetype = { -- List of ignored file types
            "NvimTree",
            "TelescopePrompt",
          },
          buftype = { -- List of ignored buftypes
            "terminal",
            "quickfix",
          },
          bufname = { -- List of regex patterns matching ignored buffer names
            -- [[.*foo/bar/baz\.qux]]
          },
        },
      })
    end
  },
  -- {
  --   'suketa/nvim-dap-ruby',
  --   config = function()
  --     require("dap-ruby").setup()
  --   end,
  -- },
  -- {
  --   "nvim-neotest/neotest",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-neotest/neotest-plenary",
  --     "olimorris/neotest-rspec",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim"
  --   },
  --   config = function()
  --     require("neotest").setup({
  --       adapters = {
  --         require('neotest-rspec'),
  --       },
  --     })
  --   end,
  -- },
  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  }
}

-- Configure builtins
require("user.builtin").config()

-- Plugins with no configuration
-- require("user.plugins").config()
-- require("user.plugins").keybindings()

-- GitHub CoPilot
require("user.copilot").config()
-- Git related
require("user.git").config()
-- -- Minimap
-- -- require("user.minimap").config()
-- -- require("user.minimap").keybindings()
-- -- Window management
-- require("user.window").config()
-- require("user.window").keybindings()
-- -- LSP
-- -- require("lvim.lsp.manager").setup("rnix")
-- require("user.functions").rubocop()

-- require('lspconfig').solargraph.setup { cmd = { "solargraph", "stdio" } }
-- lvim.keys.normal_mode["gR"] = "<cmd>lua vim.lsp.buf.references()<CR>"
-- lvim.keys.normal_mode["gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>"
