return function()
    local lspconfig = require("lspconfig")
    local servers = { "rust_analyzer", "gopls", "pylsp", "clangd", "zls" }
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        -- `:help vim.lsp.* for docs
        local keys = {
            { "gd", vim.lsp.buf.definition },
            { "K", vim.lsp.buf.hover },
            { "gt", vim.lsp.buf.type_definition },
            { "gr", vim.lsp.buf.references },
            { "<leader>rn", vim.lsp.buf.rename },
            { "<leader>fm", function()
                vim.lsp.buf.format { async = true }
            end },
        }

        for _, v in ipairs(keys) do
            vim.keymap.set("n", v[1], v[2], opts)
        end
    end

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = on_attach,
            flags = { debounce_text_changes = 150 },
            capabilities = capabilities,
        }
    end
end
