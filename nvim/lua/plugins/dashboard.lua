return {
    -- The main dashboard plugin, changed to dashboard-nvim
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter", -- Load the plugin on startup
        -- This plugin is a dependency for the dashboard to show nice icons
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- The configuration function runs after the plugin is loaded
        config = function()
            -- dashboard-nvim is configured primarily using global variables
            vim.g.dashboard_custom_header = {
                "██████╗ ██████╗  █████╗ ███╗   ██╗████████╗ ██████╗ ",
                "██╔══██╗██╔══██╗██╔══██╗████╗  ██║╚══██╔══╝██╔═══██╗",
                "██████╔╝██████╔╝███████║██╔██╗ ██║   ██║   ██║   ██║",
                "██╔═══╝ ██╔══██╗██╔══██║██║╚██╗██║   ██║   ██║   ██║",
                "██║     ██║  ██║██║  ██║██║ ╚████║   ██║   ╚██████╔╝",
                "╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ",
            }

            -- Define the buttons for quick actions on your dashboard
            -- The format is { key = { "description", "command" } }
            vim.g.dashboard_custom_section = {
                e = { "  New file", ":enew" },
                f = { "  Find file", ":Telescope find_files" },
                r = { "  Recent files", ":Telescope oldfiles" },
                t = { "  Find text", ":Telescope live_grep" },
                c = { "  Config", ":e " .. vim.fn.stdpath("config") .. "/lua/custom/" },
                q = { "  Quit", ":qa" },
            }

            -- Display a footer with plugin stats
            local function get_lazy_stats()
                -- pcall to safely load lazy in case it's not ready
                local status_ok, lazy = pcall(require, "lazy")
                if not status_ok then
                    return ""
                end
                local stats = lazy.stats()
                return "⚡ Neovim loaded "
                    .. stats.count
                    .. " plugins in "
                    .. string.format("%.2f", stats.startuptime)
                    .. "ms"
            end

            vim.g.dashboard_custom_footer = { get_lazy_stats() }
        end,
    },
}
