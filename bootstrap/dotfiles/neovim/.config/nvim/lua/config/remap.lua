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
	if not current_config then
		vim.notify("virtual lines toggle failed: current_config is nil", vim.log.levels.ERROR)
		return
	end

	local new_state = not current_config.virtual_lines
	vim.diagnostic.config({ virtual_lines = new_state })
end)

function DuplicateToTmuxPane()
	local DIRECTION = {
		HORIZONTAL = "h",
	}

	-- Get current file and position
	local file_path = vim.fn.expand("%:p")
	local line_num = vim.fn.line(".")
	local col_num = vim.fn.col(".")

	-- Create tmux command to duplicate the current state
	local tmux_cmd = string.format(
		"tmux split-window -%s 'cd %s && nvim +%d %s && nvim +\"call cursor(%d, %d)\" %s'",
		DIRECTION.HORIZONTAL,
		vim.fn.getcwd(),
		line_num,
		file_path,
		line_num,
		col_num,
		file_path
	)

	vim.fn.system(tmux_cmd)
end

vim.keymap.set(
	"n",
	"<leader>th",
	DuplicateToTmuxPane,
	{ noremap = true, silent = true, desc = "Duplicate to horizontal tmux pane" }
)
