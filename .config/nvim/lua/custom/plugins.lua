local plugings = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        "git_config",
        "gitignore",

        "html",
        "css",

        "json",
        "yaml",
        "toml",

        "dockerfile",

        "bash",
        "sql",

        "cmake",
        "make",

        "c",
        "cpp",
        "rust",
        "zig",
        "go",
        "javascript",
        "typescript",
        "tsx",
      },
    },
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
      {
        "folke/trouble.nvim",
        config = function()
          require("custom.configs.trouble")
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "prettierd",
        "shfmt",
        "taplo",
        "rust-analyzer",
      },
    },
  },
}
return plugings
