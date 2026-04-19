return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo", "Format", "FormatToggle", "FormatEnable", "FormatDisable" },
	keys = {
		{
			"^f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	opts = {
		format = {
			timeout_ms = 3000,
			async = false,
			quiet = false,
			lsp_fallback = true,
		},
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 3000, lsp_fallback = true }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			vue = { "prettier" },
			php = { "php_cs_fixer", "phpcbf" },
			blade = { "blade-formatter" },
			yaml = { "yamlfmt" },
			json = { "jq" },
			markdown = { "markdown-toc" },
			html = { "html_beautify" },
		},
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2", "-s", "-ci" },
			},
			sqlfluff = {
				prepend_args = { "--dialect", "postgres" },
			},
			mojo = {
				inherit = false,
				command = "mojo",
				args = { "format", "--quiet", "$FILENAME" },
				stdin = false,
			},
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
				vim.notify("Autoformat disabled for this buffer", 1, { title = "Conform" })
			else
				vim.g.disable_autoformat = true
				vim.notify("Autoformat disabled", 1, { title = "Conform" })
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
			vim.notify("Autoformat enabled", 1, { title = "Conform" })
		end, {
			desc = "Re-enable autoformat-on-save",
		})

		vim.api.nvim_create_user_command("FormatToggle", function()
			if vim.b.disable_autoformat or vim.g.disable_autoformat then
				vim.cmd("FormatEnable")
			else
				vim.cmd("FormatDisable")
			end
		end, {
			desc = "Toggle autoformat-on-save",
		})

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })
	end,
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
