local M = {}

local plugins = {
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
  {
    'j-hui/fidget.nvim',
    config = function()
      require("fidget").setup()
    end,
  },
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
  {
    'suketa/nvim-dap-ruby',
    config = function()
      require("dap-ruby").setup()
    end,
  },
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

M.config = function()
  for _, plugin in ipairs(plugins) do
    table.insert(lvim.plugins, plugin)
  end
end

M.keybindings = function()
  -- lvim.builtin.which_key.mappings["r"] = {
  --   name = "Run tests",
  --   s = { "<cmd>lua require('neotest').run.run()<CR>", "Current Function" },
  --   f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Current File" },
  --   d = { "<cmd>lua require('neotest').run.run(vim.fn.expand(vim.fn.getcwd()))<CR>", "Current Directory" },
  -- }

  -- Map rubocop autofix command
  -- lvim.builtin.which_key.mappings["lR"] = { "<cmd>%!rubocop --autocorrect %<CR>", "Rubocop Autocorrect" }
end

return M
