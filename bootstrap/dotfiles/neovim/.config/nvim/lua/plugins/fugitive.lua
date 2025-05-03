return {
	"tpope/vim-fugitive",
	config = function()
		local git = function()
			vim.cmd("Git")
		end
		vim.keymap.set("n", "<leader>gs", git)
	end,
}
