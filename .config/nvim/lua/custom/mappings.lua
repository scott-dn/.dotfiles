local M = {}

M.scott = {
	n = {
		[";"] = { ":", "command mode" },
		["QQ"] = { ":q!<CR>", "quit" },
		["<leader>s"] = { ":w!<CR>", "save" },
		["<C-v>"] = { ":vs!<CR>", "vertical split" },
		["<C-x>"] = { ":sp!<CR>", "horizontal split" },
		["FF"] = { ":Format<CR>", "Format" },

    -- tabbuf
    ["<A-1>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[1]) end, "GoToTab1" },
    ["<A-2>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[2]) end, "GoToTab2" },
    ["<A-3>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[3]) end, "GoToTab3" },
    ["<A-4>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[4]) end, "GoToTab4" },
    ["<A-5>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[5]) end, "GoToTab5" },
    ["<A-6>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[6]) end, "GoToTab6" },
    ["<A-7>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[7]) end, "GoToTab7" },
    ["<A-8>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[8]) end, "GoToTab8" },
    ["<A-9>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[9]) end, "GoToTab9" },
    ["<A-0>"] = { function() vim.api.nvim_set_current_buf(vim.t.bufs[10]) end, "GoToTab10" },

		-- tab
		["<A-n>"] = { ":tabe<CR>", "new tab" },
		["<A-w>"] = { ":tabc<CR>", "close tab" },
		["<A-tab>"] = { ":tabn<CR>", "next tab" },
		["<A-S-tab>"] = { ":tabp<CR>", "previous tab" },
		["<M-C-Y>"] = { ":tabp<CR>", "previous tab (alacritty hack)" }, -- FIXME: please
		["<F1>"] = { "1gt", "go to tab 1" },
		["<F2>"] = { "2gt", "go to tab 2" },
		["<F3>"] = { "3gt", "go to tab 3" },
		["<F4>"] = { "4gt", "go to tab 4" },
		["<F5>"] = { "5gt", "go to tab 5" },
		["<F6>"] = { "6gt", "go to tab 6" },
		["<F7>"] = { "7gt", "go to tab 7" },
		["<F8>"] = { "8gt", "go to tab 8" },
		["<F9>"] = { "9gt", "go to tab 9" },
		["<F10>"] = { "10gt", "go to tab 10" },

		-- motion
		["<C-d>"] = { "<C-d>zz", "move 1/2 down keep cursor" },
		["<C-u>"] = { "<C-u>zz", "move 1/2 up keep cursor" },
		["<C-f>"] = { "<C-f>zz", "move down keep cursor" },
		["<C-b>"] = { "<C-b>zz", "move up keep cursor" },

		-- search
		["n"] = { "nzz", "search keep cusor" },
		["N"] = { "Nzz", "search keep cusor" },

		-- resize
		["<M-F>"] = { ":vertical resize +10<CR>", "resize window with width+10" },
		["<M-B>"] = { ":vertical resize -10<CR>", "resize window with width-10" },
		["<M-Right>"] = { ":vertical resize +10<CR>", "resize window with width+10 (alacritty hack)" }, -- FIXME: please
		["<M-Left>"] = { ":vertical resize -10<CR>", "resize window with width-10 (alacritty hack)" }, -- FIXME: please
		["<M-Up>"] = { ":resize -5<CR>", "resize window with height-5" },
		["<M-Down>"] = { ":resize +5<CR>", "resize window with height+5" },

		-- telescope
		["<leader>FF"] = {
			":execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>",
			"Find cursor",
		},
	},

	i = {
		["jk"] = { "<ESC>", "escape insert mode" },
	},

	v = {
		["J"] = { ":m '>+1<CR>gv=gv", "move section down" },
		["K"] = { ":m '<-2<CR>gv=gv", "move section up" },
	},
}

return M
