return {
    "stevearc/conform.nvim",
    event = {
        "BufReadPre",
        "BufNewFile"
    },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" } ,
                typescript = { "prettier" },
                svelte = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                astro = { "prettier" },
                markdown = { "prettier" },
                yaml = { "prettier" },
                json = { "prettier" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout = 500
            }
        })
    end
}