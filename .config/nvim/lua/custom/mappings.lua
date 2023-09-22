local M = {}

M.scott = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<A-1>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[1]) end, "GoToTab1", opts = { nowait = true } },
    ["<A-2>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[2]) end, "GoToTab2", opts = { nowait = true } },
    ["<A-3>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[3]) end, "GoToTab3", opts = { nowait = true } },
    ["<A-4>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[4]) end, "GoToTab4", opts = { nowait = true } },
    ["<A-5>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[5]) end, "GoToTab5", opts = { nowait = true } },
    ["<A-6>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[6]) end, "GoToTab6", opts = { nowait = true } },
    ["<A-7>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[7]) end, "GoToTab7", opts = { nowait = true } },
    ["<A-8>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[8]) end, "GoToTab8", opts = { nowait = true } },
    ["<A-9>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[9]) end, "GoToTab9", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz", "move 1/2 down keep cursor", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "move 1/2 up keep cursor", opts = { nowait = true } },
    ["<C-f>"] = { "<C-f>zz", "move down keep cursor", opts = { nowait = true } },
    ["<C-b>"] = { "<C-b>zz", "move up keep cursor", opts = { nowait = true } },
    ["n"] = { "nzz", "search keep cusor" },
    ["N"] = { "Nzz", "search keep cusor" },
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },

  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "move section down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move section up" }
  },
}

return M
