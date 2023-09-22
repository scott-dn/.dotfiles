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
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer"
      }
    }
  }
}
return plugings
