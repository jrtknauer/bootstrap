vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    root_markers = { ".git" },
})

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
    -- Terraform
    "terraform-ls",
})

-- LSP remaps.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        local opts = { buffer = e.buf }

        vim.keymap.set("n", "<leader>i", function()
            local current = vim.lsp.inlay_hint.is_enabled({ 0 })
            vim.lsp.inlay_hint.enable(not current)
        end)

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
    end,
})
