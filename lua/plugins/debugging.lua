return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

            dapui.setup()
            require("dap-python").setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>dt", function()
				dap.toggle_breakpoint()
			end)
			vim.keymap.set("n", "<Leader>dc", function()
				dap.continue()
			end)
		end,
	},
}
