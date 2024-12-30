return {
	"tpope/vim-fugitive",
	config = function()
		local git = function()
			vim.cmd("vertical Git")
		end
		vim.keymap.set("n", "<leader>gs", git)
	end,
}
