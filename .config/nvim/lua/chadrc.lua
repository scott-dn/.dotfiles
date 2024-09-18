---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "onedark",
  statusline = {
    theme = "vscode_colored",
  },
  tabufline = {
    show_numbers = true,
  },
  hl_override = {
    Comment = {
      italic = true,
    },
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
    "buf-language-server",
    "buf",
  },
}
return M
