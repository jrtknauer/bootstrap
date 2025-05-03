local M = {}

---@enum PANE_DIRECTION
M.PANE_DIRECTION = {
    HORIZONTAL = "h",
    VERTICAL = "v",
}

---@param split_direction PANE_DIRECTION
M.duplicate_pane = function(split_direction)
    split_direction = split_direction or M.PANE_DIRECTION.HORIZONTAL

    -- Get current file and position
    local file_path = vim.fn.expand("%:p")
    local line_num = vim.fn.line(".")
    local col_num = vim.fn.col(".")
    local current_dir = vim.fn.getcwd()

    vim.cmd("redraw")

    local nvim_cmd = string.format(
        "cd %s && nvim %s -c 'call cursor(%d, %d)'",
        vim.fn.shellescape(current_dir),
        vim.fn.shellescape(file_path),
        line_num,
        col_num
    )

    local tmux_cmd = string.format(
		"tmux split-window -%s -d %s",
		split_direction,
		vim.fn.shellescape(nvim_cmd)
	)
    vim.fn.system(tmux_cmd)

    vim.defer_fn(function()
        local layout_type
        if split_direction == M.PANE_DIRECTION.HORIZONTAL then
            layout_type = "even-horizontal"
        else
            layout_type = "even-vertical"
        end

        vim.fn.system("tmux select-layout " .. layout_type)
        vim.cmd("redraw!")
    end, 200)
end

return M
