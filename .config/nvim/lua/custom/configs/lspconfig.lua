local configs = require("plugins.configs.lspconfig")

local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

lspconfig["rust_analyzer"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetype = { "rust" },
	root_dir = lspconfig.util.root_pattern("Cargo.toml"),
})
