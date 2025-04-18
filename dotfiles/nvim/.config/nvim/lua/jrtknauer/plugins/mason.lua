return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = cmp_lsp.default_capabilities(capabilities)

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"biome",
				"gopls",
				"lua_ls",
				"terraformls",
				"pyright",
				"typos_lsp",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["biome"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.biome.setup({
						capabilities = capabilities,
						single_file_support = true,
					})
				end,
				["gopls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.gopls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								hints = {
									parameterNames = true,
								},
							},
						},
					})
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = {
										"capabilities",
										"cmp_select",
										"vim",
									},
								},
								hint = {
									enable = true,
								},
							},
						},
					})
				end,
			},
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm(cmp_select),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
			}),
		})
	end,
}
