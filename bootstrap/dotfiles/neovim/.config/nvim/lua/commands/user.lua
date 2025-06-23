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
