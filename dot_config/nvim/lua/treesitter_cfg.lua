return function()
    require("nvim-treesitter.configs").setup {
        ensure_installed = {
            "bash", "fish", "go", "html", "json", "python", "ruby",
            "rust", "toml", "tsx", "typescript", "yaml", "zig",
        },
        sync_install = false,
        auto_install = false,
        ignore_install = {},
        highlight = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = false,
        }
    }
end
