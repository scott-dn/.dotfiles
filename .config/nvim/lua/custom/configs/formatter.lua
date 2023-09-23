local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end
				-- Full specification of configurations is down below and in Vim help
				-- files
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

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
