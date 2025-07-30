return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        "folke/snacks.nvim",
        dependencies = {
            "echasnovski/mini.icons",
        },
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                preset = {
                    header = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
                },
            },
            indent = { enabled = true },
            input = { enabled = true },
            git = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scroll = { enabled = false },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
        keys = {
            {
                "<leader>sf",
                function()
                    Snacks.scratch()
                end,
                desc = "Toggle Scratch Buffer",
            },
            {
                "<leader>S",
                function()
                    Snacks.scratch.select()
                end,
                desc = "Select Scratch Buffer",
            },
            {
                "<leader>gl",
                function()
                    Snacks.lazygit.log_file()
                end,
                desc = "Lazygit Log (cwd)",
            },
            {
                "<leader>lg",
                function()
                    Snacks.lazygit()
                end,
                desc = "Lazygit",
            },
            {
                "<C-p>",
                function()
                    Snacks.picker.pick("files")
                end,
                desc = "Find Files",
            },
            {
                "<leader><leader>",
                function()
                    Snacks.picker.recent()
                end,
                desc = "Recent Files",
            },
            {
                "<leader>fb",
                function()
                    Snacks.picker.buffers()
                end,
                desc = "Buffers",
            },
            {
                "<leader>fg",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Grep Files",
            },
            {
                "<C-n>",
                function()
                    Snacks.explorer()
                end,
                desc = "Explorer",
            },
        },
    },
}
