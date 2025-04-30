require("jrtknauer.config.remap")
require("jrtknauer.config.set")
require("jrtknauer.config.lazy")

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(e)
		local opts = { buffer = e.buf }

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)

		vim.keymap.set("n", "<leader>vrr", function()
			require("telescope.builtin").lsp_references({ show_line = false })
		end, opts)

		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)

		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format()
		end, opts)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.wo.relativenumber = true
		vim.wo.number = true
	end,
})

-- Docker Bake does not have an LSP. While YAML is supported HCL is preferred.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "hcl",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})
