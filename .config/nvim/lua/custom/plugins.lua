local plugings = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("custom.configs.hl"),
  },
  {
    "folke/trouble.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mhartington/formatter.nvim",
        config = function()
          require("custom.configs.formatter")
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require("custom.configs.rust-tools")
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "typescript-language-server",
        "prettier",
        "prettierd",
        "shfmt",
        "taplo",
        "rust-analyzer",
        "clang-format"
      },
    },
  },
}
return plugings
