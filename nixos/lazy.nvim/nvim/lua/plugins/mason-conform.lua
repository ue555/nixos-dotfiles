return {
	"williamboman/mason.nvim",
	"stevearc/conform.nvim",
	"zapling/mason-conform.nvim",
	config = function()
		require("mason-conform").setup()
	end,
}
