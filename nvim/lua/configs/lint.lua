local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    -- html = { "htmlhint" },
    -- css = { "stylelint" },
    javascript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    typescript = { "eslint_d" },
    jsx = { "eslint_d" },
    tsx = { "eslint_d" },
    -- haskell = { "hlint" },
    -- python = { "flake8" },
}

lint.linters.luacheck.args = {
    "--globals",
    "love",
    "vim",
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})
