return {
    "nvimtools/hydra.nvim",
    event = "LazyFile",
    config = function()
        local Hydra = require("hydra");
        -- DEBUGGING
        -- TODO: exit this hydra on Dap disconnecting
        Hydra({
            name = "Debugging",
            mode = "n",
            body = "<leader>db",
            hint = [[ TODO ]],
            config = {
                buffer = true,
                invoke_on_body = true,
                color = "pink",
                on_exit = function()
                    vim.cmd("DapDisconnect")
                end
            },
            heads = {
                { "<F5>",  "<cmd>DapContinue<cr>",         { desc = "Continue" } },
                { "<F10>", "<cmd>DapStepOver<cr>",         { desc = "Step Over" } },
                { "<F11>", "<cmd>DapStepInto<cr>",         { desc = "Step Into" } },
                { "<F12>", "<cmd>DapStepOut<cr>",          { desc = "Step Out" } },
                { "b",     "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" } },
            }
        })
    end
}
