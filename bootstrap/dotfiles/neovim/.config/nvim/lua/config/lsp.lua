tmux = require("config.tmux")

-- Base LSP configuration.
local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.lsp.config("*", {
    capabilities = capabilities,
    root_markers = { ".git" },
})

-- Enable LSPs.
vim.lsp.enable({
    -- Bash
    "bash-language-server",
    -- Go
    "golangci-lint-langserver",
    "gopls",
    -- Lua
    "lua-language-server",
    -- Python
    "basedpyright",
    "ruff",
})

-- Enable LSP completions.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            return
        end

        vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end,
})

-- LSP remaps.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        local opts = { buffer = e.buf }

        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)

        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, opts)

        vim.keymap.set("n", "<leader>vrr", function()
            require("telescope.builtin").lsp_references({ show_line = false })
        end, opts)

        vim.keymap.set("n", "<leader>vrn", function()
            vim.lsp.buf.rename()
        end, opts)

        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format()
        end, opts)

        -- Tmux
        local function tmux_lsp_wrapper(lsp_command)
            return function()
                -- Get current file path and position information
                local file_path = vim.fn.expand("%:p")
                local line_num = vim.fn.line(".")
                local col_num = vim.fn.col(".")

                -- Call the LSP command to find the location
                lsp_command()

                -- Get target location
                local target_file = vim.fn.expand("%:p")
                local target_line = vim.fn.line(".")
                local target_col = vim.fn.col(".")

                -- Go back to original position
                vim.cmd("edit " .. file_path)
                vim.api.nvim_win_set_cursor(0, { line_num, col_num - 1 })

                -- Open in tmux
                local tmux_cmd = string.format(
                    "tmux split-window -h 'nvim +%d %s && nvim +" .. '"call cursor(%d, %d)" %s\'',
                    target_line,
                    target_file,
                    target_line,
                    target_col,
                    target_file
                )

                vim.fn.system(tmux_cmd)
            end
        end
        vim.keymap.set(
            "n",
            "<leader>tgd",
            tmux_lsp_wrapper(vim.lsp.buf.definition),
            vim.tbl_extend("force", opts, { desc = "Go to definition in tmux pane" })
        )
        vim.keymap.set("n", "<leader>td", tmux.duplicate_pane, opts)
    end,
})
