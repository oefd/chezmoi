return function()
    require("lualine").setup {
        options = {
            theme = "nord",
            section_separators = { left = "", right = "" },
            component_separators = "",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    }
end
