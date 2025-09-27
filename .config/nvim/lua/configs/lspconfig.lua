local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local capabilities = configs.capabilities

local util = require "lspconfig/util"

vim.lsp.config["clangd"] = {
  on_attach = function(client, bufnr)
    -- client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

vim.lsp.config["ts_ls"] = {
  on_attach = on_attach,
  capabilities = capabilities,
}

vim.lsp.config["gopls"] = {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      gofumpt = true,
      usePlaceholders = true,
      completeUnimported = true,
      analyses = {
        unusedvariable = true,
        -- shadow = true,
        useany = true,
      },
    },
  },
}

vim.lsp.config["pbls"] = {
  on_attach = on_attach,
  capabilities = capabilities,
}

vim.lsp.config["docker_compose_language_service"] = {
  on_attach = on_attach,
  capabilities = capabilities,
}

vim.lsp.config["dockerls"] = {
  on_attach = on_attach,
  capabilities = capabilities,
}

vim.lsp.config["bashls"] = {
  on_attach = on_attach,
  capabilities = capabilities,
}

vim.lsp.config["postgres_lsp"] = {
  on_attach = on_attach,
  capabilities = capabilities,
}

vim.lsp.enable "pyrefly"
