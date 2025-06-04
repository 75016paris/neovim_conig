local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics --ruff desactiver pour l'instant. voir none-ls vs null-ls

null_ls.setup({
    sources = {
        formatting.black.with({
            extra_args = { "--fast" },
        }),
    },
})
