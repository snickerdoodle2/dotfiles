return {
    "folke/trouble.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local trouble = require("trouble")

        vim.keymap.set("n", "<leader>xx", function() trouble.toggle("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end)
        vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end)
        vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end)
    end
}
