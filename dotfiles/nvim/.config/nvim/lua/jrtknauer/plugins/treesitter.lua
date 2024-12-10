return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"go",
			"just",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"vim",
			"vimdoc",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
		additional_vim_regex_highlighting = false,
	},
}
