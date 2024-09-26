local plugings = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.hl",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mhartington/formatter.nvim",
        config = function()
          require "configs.formatter"
        end,
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local config = require "nvchad.configs.telescope"
      local telescopeConfig = require "telescope.config"

      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
      table.insert(vimgrep_arguments, "--hidden")
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")

      config.defaults.vimgrep_arguments = vimgrep_arguments
      config.pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      }

      return config
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
  },
}
return plugings
