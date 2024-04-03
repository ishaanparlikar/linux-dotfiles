return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile"
    },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            svelte = { "eslint_d" },
            html = { "eslint_d" },
            css = { "eslint_d" },
            astro = { "eslint_d" },
            markdown = { "eslint_d" },
            yaml = { "eslint_d" },
            json = { "eslint_d" },
        }

        local lint_autogroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({
                "BufEnter",
                "BufWritePost",
                "InsertLeave"
            },
            {
                group = lint_autogroup,
                callback = function()
                    lint.try_lint()
                end
            })
    end
}
