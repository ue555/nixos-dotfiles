return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		if vim.fn.executable("cc") == 1 or vim.fn.executable("gcc") == 1 or vim.fn.executable("clang") == 1 then
			vim.cmd("TSUpdate")
		end
	end,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			modules = {},
			ensure_installed = {},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			ignore_install = {},
			auto_install = false,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
