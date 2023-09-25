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
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
return M
