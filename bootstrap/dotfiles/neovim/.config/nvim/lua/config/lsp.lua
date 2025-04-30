-- Base LSP configuration.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

-- Enable LSPs.
vim.lsp.enable({
	-- Bash
	"bash-language-server",
	-- Lua
	"lua-language-server",
	-- Python
	"basedpyright",
	"ruff",
})

-- Enable LSP completions.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
	end,
})

-- LSP remaps.
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
