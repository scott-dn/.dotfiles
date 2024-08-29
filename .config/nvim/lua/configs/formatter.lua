local util = require "formatter.util"

require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
      function()
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
    sh = {
      require("formatter.filetypes.sh").shfmt(),
    },
    css = {
      require("formatter.filetypes.css").prettierd,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettierd,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettierd,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettierd,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettierd,
    },
    markdown = {
      require("formatter.filetypes.markdown").prettierd,
    },
    yaml = {
      require("formatter.filetypes.yaml").prettierd,
    },
    json = {
      require("formatter.filetypes.json").prettierd,
    },
    toml = {
      require("formatter.filetypes.toml").taplo(),
    },
    go = {
      function()
        return {
          exe = "goimports-reviser",
        }
      end,
      require("formatter.filetypes.go").golines(),
      require("formatter.filetypes.go").gofumpt(),
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt(),
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },
    sql = {
      function()
        return {
          exe = "pg_format",
          args = {
            "-i",
          },
          stdin = true,
          ignore_exitcode = true,
        }
      end,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}
