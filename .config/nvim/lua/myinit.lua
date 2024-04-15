vim.opt.colorcolumn = "80"

vim.wo.wrap = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.list = true
vim.opt.listchars = { tab = "»»", trail = "·", extends = "→", precedes = "←" }

-- auto save
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand "%" ~= "" and vim.bo.buftype == "" then
      vim.api.nvim_command "silent update"
    end
  end,
})
