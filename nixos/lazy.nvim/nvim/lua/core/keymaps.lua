-- usually
vim.api.nvim_set_keymap("n", "q", "<cmd>q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "qa", "<cmd>qa<CR>", { noremap = true, silent = true })

vim.o.clipboard = "unnamedplus"

-- nvim-tree
vim.keymap.set("n", "]e", ":NvimTreeOpen<CR>")

-- telescope.nvim
local builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fg", builtin.live_grep, {})
vim.keymap.set("n", "<Space>fb", builtin.buffers, {})
vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})

-- nvim-markdown.lua
-- Normal mode mappings
vim.api.nvim_set_keymap("n", "]]", "<Plug>Markdown_MoveToNextHeader", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[[:", "<Plug>Markdown_MoveToPreviousHeader", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "][:", "<Plug>Markdown_MoveToNextSiblingHeader", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[]", "<Plug>Markdown_MoveToPreviousSiblingHeader", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]c", "<Plug>Markdown_MoveToCurHeader", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]u", "<Plug>Markdown_MoveToParentHeader", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", "<Plug>Markdown_Checkbox", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>q", "<Plug>Markdown_Fold", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<CR>", "<Plug>Markdown_FollowLink", { noremap = true, silent = true })

-- Insert mode mappings
vim.api.nvim_set_keymap("i", "<Tab>q", "<Plug>Markdown_Jump", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>Markdown_CreateLink", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-O>", "<Plug>Markdown_NewLineAbove", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-o>", "<Plug>Markdown_NewLineBelow", { noremap = true, silent = true })

-- Visual mode mappings
vim.api.nvim_set_keymap("v", "<C-k>", "<Plug>Markdown_CreateLink", { noremap = true, silent = true })

-- mr-quickfix.lua
vim.api.nvim_set_keymap("n", "mu", "<cmd>Mru | copen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mw", "<cmd>Mrw | copen<CR>", { noremap = true, silent = true })
