require("config.remap")
require("config.set")
require("config.lazy")
require("config.lsp")

vim.diagnostic.config({
	virtual_text = true,
})

-- Netrw relative line numbers.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.wo.relativenumber = true
		vim.wo.number = true
	end,
})
