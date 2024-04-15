local plugings = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.hl"),
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
          require("configs.formatter")
        end,
      },
    },
    config = function()
      require("nvchad.configs.lspconfig")
      require("configs.lspconfig")
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require("configs.rust-tools")
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
