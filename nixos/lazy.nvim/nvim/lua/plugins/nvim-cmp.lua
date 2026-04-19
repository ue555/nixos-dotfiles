return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = function()
				if vim.fn.executable("make") == 1 and (vim.fn.executable("cc") == 1 or vim.fn.executable("gcc") == 1 or vim.fn.executable("clang") == 1) then
					vim.fn.system("make install_jsregexp")
				end
			end,
		},
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "buffer" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				["<M-Up>"] = cmp.mapping.select_prev_item(),
				["<M-Down>"] = cmp.mapping.select_next_item(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
		})
	end,
}
