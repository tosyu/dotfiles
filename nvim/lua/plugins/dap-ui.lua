return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"stevearc/overseer.nvim",
	},
	config = function ()
		local dap = require("dap")
		local dapui = require("dapui")
		local overseer = require("overseer")

		dapui.setup()
		overseer.enable_dap()

		vim.fn.sign_define("DapBreakpoint", {text = "B"})

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
			dapui.open()
		end
	end,
	keys = {
		{
			"<leader>du",
			function()
				require("dapui").toggle({})
			end,
			desc = "Dap UI",
		},
	},
}
