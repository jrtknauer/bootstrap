vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Centered vertical navigation.
-- Need `down` to mitigate re-render when navigating from the top of a file.
local down = function()
	local line_num = vim.fn.line(".")
	local window_height = vim.fn.winheight(0)
	if line_num <= (window_height / 2) then
		return "<C-d>"
	else
		return "<C-d>zz"
	end
end
vim.keymap.set("n", "<C-d>", down, { expr = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Yank to system clipboard.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Delete to the void register.
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Never going to use this.
vim.keymap.set("n", "Q", "<nop>")

-- Tmux session.
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new-window tmux_session.sh<CR>")

-- Toggle virtual lines.
vim.keymap.set("n", "<leader>l", function()
	local current_config = vim.diagnostic.config()
	if not current_config then
		vim.notify("virtual lines toggle failed: current_config is nil", vim.log.levels.ERROR)
		return
	end

	local new_state = not current_config.virtual_lines
	vim.diagnostic.config({ virtual_lines = new_state })
end)

-- Toggle list characters.
vim.keymap.set("n", "<leader>w", function()
    local current_state = vim.opt.list:get() or false
	local new_state = not current_state
    vim.opt.list = new_state
end)
