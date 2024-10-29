---@type ChadrcConfig
local M = {}

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
  },
}
return M
