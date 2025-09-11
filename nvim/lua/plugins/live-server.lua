return {
    -- Live server plugin with built-in keymaps
    {
        "barrett-ruth/live-server.nvim",
        -- Set the plugin to only load when the specified commands or keymaps are used
        cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
        -- Keys property is a lazy.nvim feature that loads the plugin on keypress
        keys = {
            { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Start Live Server" },
            { "<leader>lp", "<cmd>LiveServerStop<cr>", desc = "Stop Live Server" },
            { "<leader>lt", "<cmd>LiveServerToggle<cr>", desc = "Toggle Live Server" },
        },
        -- Use the config function to set up the plugin after it is loaded
        config = function()
            require("live-server").setup({
                -- Optional configuration options
                port = 5555, -- Default port for the server
                open = "browser", -- How to open the browser: 'browser' or 'integrated'
            })
        end,
    },
}
