return {
	{
	"julianolf/nvim-dap-lldb",
   dependencies = {"mfussenegger/nvim-dap"},
   opts = {codelldb_path = "/path/to/codelldb"},
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"mason-org/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
			"julianolf/nvim-dap-lldb",
			"rcarriga/nvim-dap-ui",
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
				"<leader>d",
				group = "Debugger",
				nowait = true,
				remap = false,
			},
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI",
			},
			{
				"<leader>db",
				function() require("dap").toggle_breakpoint() end,
				desc = "Toggle breakpoint",
			},
			{
				"<leader>dc",
				function() require("dap").continue() end,
				desc = "Continue",
			},
			{
				"<leader>do",
				function() require("dap").step_over() end,
				desc = "Step over",
			},
			{
				"<leader>di",
				function() require("dap").step_into() end,
				desc = "Step over",
			},
			{
				"<leader>du",
				function() require("dap").step_out() end,
				desc = "Step over",
			},
			{
				"<leader>dr",
				function ()
					require("dap").repl.open()
				end,
				desc = "REPL",
			},
			{
				"<leader>dC",
				function() require("dap").run_to_cursor() end,
				desc = "Run to cursor",
			},
			{
				"<leader>dq",
				function() 
					require("dap").terminate()
					require("dapui").close()
				end,
				desc = "Terminate",
			},
		},
	},
}
