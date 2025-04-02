---@type ChadrcConfig
local M = {}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
}

M.base46 = {
  theme = "onedark",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.mason = {
  cmd = true,
  pkgs = {
    -- lua
    "lua-language-server",
    "stylua",

    -- ts, js, html, css, yml, markdown, json
    "typescript-language-server",
    "prettierd",

    -- bash/shell
    "shfmt",
    "bash-language-server",

    -- toml
    "taplo",

    -- rust
    "rust-analyzer",

    -- c++
    "clangd",
    "clang-format",

    -- go
    "gopls",
    "gofumpt",
    "goimports-reviser",
    "golines",

    -- protobuf
    "pbls",
    "buf",

    -- docker
    "docker-compose-language-service",
    "dockerfile-language-server",

    -- postgres
    "postgrestools",
  },
}
return M
