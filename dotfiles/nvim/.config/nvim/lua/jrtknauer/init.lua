require("jrtknauer.config.remap")
require("jrtknauer.config.set")
require("jrtknauer.config.lazy")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local jrtknauer_group = augroup("jrtknauer", {})

autocmd("LspAttach", {
	group = jrtknauer_group,
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

autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.wo.relativenumber = true
		vim.wo.number = true
	end,
})

-- Docker Bake does not have an LSP. While YAML is supported HCL is preferred.
autocmd("FileType", {
    pattern = "hcl",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end,
})
