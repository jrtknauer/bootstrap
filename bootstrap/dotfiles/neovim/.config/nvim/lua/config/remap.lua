vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Centered vertical navigation.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Centered search navigation.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete to the void register.
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- System clipboard.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Never going to use this.
vim.keymap.set("n", "Q", "<nop>")

-- Tmux session.
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new-window tmux_session.sh<CR>")

-- Toggle inlay hints.
vim.keymap.set("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }))
end)

-- Toggle virtual lines.
vim.keymap.set("n", "<leader>l", function()
	local current_config = vim.diagnostic.config()
	local new_state = not current_config.virtual_lines
	vim.diagnostic.config({ virtual_lines = new_state })
end)
