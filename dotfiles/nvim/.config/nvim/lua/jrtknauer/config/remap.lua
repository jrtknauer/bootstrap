vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Centered vertical navigation.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Centered search navigation.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over buffer and send the selected buffer to the void register.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete to the void register.
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Copy to system clipboard.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Worst place in the universe.
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new-window tmux_session.sh<CR>")

-- Toggle inlay hints.
vim.keymap.set("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }))
end)
