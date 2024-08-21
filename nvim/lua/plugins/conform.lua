return {
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		lazy = true,
		cmd = "ConformInfo",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			---@type conform.setupOpts
			local opts = {
				default_format_opts = {
					timeout = 3000,
					async = false,
					quiet = false,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					graphql = { "prettier" },
				},
				formatters = {
					prettier = {
						prepend_args = {
							"--arrow-parens=avoid",
							"--jsx-single-quote",
							"--single-quote", -- Use single quotes instead of double quotes
							"--use-tabs",
							"--tab-width=2",
							"--semi=false",
							"--end-of-line=lf",
							"--print-width=100",
							"--vue-indent-script-and-style=true",
						},
					},
				},
			}

			return opts
		end,
	},
}
