return {
	"ThePrimeagen/harpoon",
	name = "harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		-- Append to harpoon
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)

		-- Toggle harpoon menu
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
	end,
}
