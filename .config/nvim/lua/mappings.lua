require "nvchad.mappings"

local map = vim.keymap.set

-- escapse terminal mode
map("t", "jk", "<C-\\><C-n>")

map("n", ";", ":")
map("n", "q", "<nop>")
map("n", "qq", ":q!<cr>")
map("n", "QQ", function() vim.cmd "qall!" end)
map("n", "<leader>q", function() require("nvchad.tabufline").closeAllBufs() end)
map("n", "<leader>s", ":w!<CR>", { desc = "save" })
map("n", "<C-v>", ":vs!<CR>", { desc = "vertical split" })
map("n", "<C-x>", ":sp!<CR>", { desc = "horizontal split" })
map("n", "FF", ":Format<CR>", { desc = "format" })
-- map("n", "<C-d>", "<C-d>zz", { desc = "move 1/2 down keep cursor" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "move 1/2 up keep cursor" })
-- map("n", "<C-f>", "<C-f>zz", { desc = "move down keep cursor" })
-- map("n", "<C-b>", "<C-b>zz", { desc = "move up keep cursor" })
-- map("n", "n", "nzz", { desc = "search keep cusor" })
-- map("n", "N", "Nzz", { desc = "search keep cusor" })
map("n", "<leader>FF", ":execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>", { desc = "Find cursor" })
map("n", "<A-1>", function() vim.api.nvim_set_current_buf(vim.t.bufs[1]) end, { desc = "go to tab01" })
map("n", "<A-2>", function() vim.api.nvim_set_current_buf(vim.t.bufs[2]) end, { desc = "go to tab02" })
map("n", "<A-3>", function() vim.api.nvim_set_current_buf(vim.t.bufs[3]) end, { desc = "go to tab03" })
map("n", "<A-4>", function() vim.api.nvim_set_current_buf(vim.t.bufs[4]) end, { desc = "go to tab04" })
map("n", "<A-5>", function() vim.api.nvim_set_current_buf(vim.t.bufs[5]) end, { desc = "go to tab05" })
map("n", "<A-6>", function() vim.api.nvim_set_current_buf(vim.t.bufs[6]) end, { desc = "go to tab06" })
map("n", "<A-7>", function() vim.api.nvim_set_current_buf(vim.t.bufs[7]) end, { desc = "go to tab07" })
map("n", "<A-8>", function() vim.api.nvim_set_current_buf(vim.t.bufs[8]) end, { desc = "go to tab08" })
map("n", "<A-9>", function() vim.api.nvim_set_current_buf(vim.t.bufs[9]) end, { desc = "go to tab09" })
map("n", "<A-0>", function() vim.api.nvim_set_current_buf(vim.t.bufs[10]) end, { desc = "go to tab10" })

map("v", "qq", "<esc>:q!<cr>")

map("i", "jk", "<esc>")
