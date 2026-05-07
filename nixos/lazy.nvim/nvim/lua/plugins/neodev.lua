return {
	"folke/neodev.nvim",
	opts = {},
	config = function()
		-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
		require("neodev").setup({
			-- add any options here, or leave empty to use the default settings
		})
	end,
}
