-------------
-- general --
vim.g.mapleader = ";"

vim.opt.number = true
vim.opt.hidden = true
vim.opt.modeline = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

--------------
-- keybinds --
local keymap_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-n>", ":bnext<cr>", keymap_opts)
vim.api.nvim_set_keymap("n", "<c-l>", ":nohl<cr>", keymap_opts)
vim.api.nvim_set_keymap("n", "<leader>bd", ":b#<bar>bd#<cr>", keymap_opts)

----------------
-- aesthetics --
vim.opt.termguicolors = true
pcall(function() vim.cmd.colorscheme("nord") end)

--------------
-- packages --
local packer_bootstrapped = require("packer_bootstrap")()
local packer = require("packer")
packer.startup(function(use)
    use { "wbthomason/packer.nvim" }

    -- aesthetics
    use { "nordtheme/vim" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "nvim-lualine/lualine.nvim",
        requires = { { "nvim-tree/nvim-web-devicons" } },
        config = require("lualine_cfg"),
    }

    -- utility
    use { "editorconfig/editorconfig-vim" }
    use { "tpope/vim-commentary" }
    use { "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = require("telescope_cfg"),
    }

    -- syntax
    use { "nvim-treesitter/nvim-treesitter",
        config = require("treesitter_cfg"),
        run = ":TSUpdate",
    }

    -- lsp
    use { "neovim/nvim-lspconfig",
        config = require("lspconfig_cfg"),
    }

    if packer_bootstrapped then packer.sync() end
end)
