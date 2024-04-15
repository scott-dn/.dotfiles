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
-- M.plugins = "plugins"
-- M.mappings = require("mappings")
return M
