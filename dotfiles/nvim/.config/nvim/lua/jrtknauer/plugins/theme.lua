return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false,
	priority = 1000,
	cond = true,
	init = function()
		vim.cmd("colorscheme github_dark_default")
	end,
}
