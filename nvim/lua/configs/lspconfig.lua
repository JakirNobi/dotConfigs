local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
    "lua_ls",
    "clangd",
    "html",
    "cssls",
    -- "gopls",
    -- "hls",
    -- "ols",
    -- "pyright",
    "ts_ls",
    "pylsp",
    "emmet_language_server",
    "tailwindcss",
}

-- list of servers configured with default config.
local default_servers = {
    -- "ols",
    -- "pyright",
    -- "html",
    "cssls",
    -- "ts_ls",
    -- "cssls",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

-- lspconfig.pyright.setup({
--     on_attach = function(client, bufnr)
--         on_attach(client, bufnr)
--     end,
--
--     on_init = function(client)
--         local default_venv_path =
--             require("lspconfig.util").path.join(vim.env.HOME, "virtualenvs", "nvim-venv", "bin", "python")
--         client.config.settings.python = client.config.settings.python or {}
--         client.config.settings.python.pythonPath = default_venv_path
--     end,
--
--     capabilities = capabilities,
-- })
--
lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.emmet_language_server.setup({
    capabilities = capabilities,
    filetypes = {
        "templ",
        "html",
        "css",
        "php",
        "javascriptreact",
        "typescriptreact",
        "javascript",
        "typescript",
        "jsx",
        "tsx",
    },
})

lspconfig.html.setup({
    capabilities = capabilities,
    filetypes = {
        "templ",
        "html",
        "php",
        "css",
        "javascriptreact",
        "typescriptreact",
        "javascript",
        "typescript",
        "jsx",
        "tsx",
    },
})

lspconfig.ts_ls.setup({
    capabilties = capabilities,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
    },
    root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", ".git"),
    single_file_support = true,
})

local function get_python_path()
    local venv_path = os.getenv("VIRTUAL_ENV")
    if venv_path then
        return venv_path .. "/bin/python3"
    else
        -- Since you're on Arch Linux, we assume this path
        return "/usr/bin/python3"
    end
end

lspconfig.pylsp.setup({
    capabilities = capabilities, -- fixed typo here
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
        },
        python = {
            pythonPath = get_python_path(),
        },
    },
})

-- lspconfig.gopls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gotmpl", "gowork" },
--     root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
--     settings = {
--         gopls = {
--             analyses = {
--                 unusedparams = true,
--             },
--             completeUnimported = true,
--             usePlaceholders = true,
--             staticcheck = true,
--         },
--     },
-- })

-- lspconfig.hls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--
--     on_init = on_init,
--     capabilities = capabilities,
-- })

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
