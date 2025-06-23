return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		extensions = {
			fzf = {},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
	},
	init = function()
		require("telescope").load_extension("fzf")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Search files" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search git files" })
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Search help tags" })

		local grep_selected = function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end
		vim.keymap.set("n", "<leader>pws", grep_selected, { desc = "Grep files for currently selected word" })

		local grep_string = function()
			local status, search = pcall(function()
				return vim.fn.input("Grep > ")
			end)

			if not status then
				return
			end

			if search == "" then
				return
			end

			builtin.grep_string({
				search = search,
				additional_args = function()
					return {
						"--hidden",
						"--smart-case",
					}
				end,
			})
		end
		vim.keymap.set("n", "<leader>ps", grep_string, { desc = "Grep files for input word" })
	end,
}
