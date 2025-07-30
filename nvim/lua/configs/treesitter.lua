local options = {
    ensure_installed = {
        "bash",
        "c",
        "css",
        "cmake",
        "cpp",
        "fish",
        -- "go",
        -- "gomod",
        -- "gosum",
        -- "gotmpl",
        -- "gowork",
        -- "haskell",
        "html",
        "javascript",
        "typescript",
        "lua",
        "luadoc",
        "make",
        "markdown",
        -- "odin",
        "printf",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
