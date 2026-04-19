vim.opt.number = true

local current_listchars = vim.opt.listchars:get()
current_listchars.space = "."
vim.opt.listchars = current_listchars

vim.opt.list = true

require("core/lazyvim")
require("core/keymaps")
