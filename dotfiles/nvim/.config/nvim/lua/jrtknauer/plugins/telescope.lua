return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
        pickers = {
            find_files = {
                theme = "ivy",
            },
            git_files = {
                theme = "ivy",
            },
            grep_string = {
                theme = "ivy",
            },
            help_tags = {
                theme = "ivy",
            },
        },
		extensions = {
			fzf = {},
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

        local grep_word = function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end
        vim.keymap.set("n", "<leader>pws", grep_word, { desc = "Grep files for currently selected word" })

	end,
}
