vim.api.nvim_create_user_command("ToggleBackground", function()
	local BACKGROUND = {
		DARK = "dark",
		LIGHT = "light",
	}

	if vim.o.background == BACKGROUND.DARK then
		vim.o.background = BACKGROUND.LIGHT
	else
		vim.o.background = BACKGROUND.DARK
	end
end, {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.wo.relativenumber = true
		vim.wo.number = true
	end,
})
