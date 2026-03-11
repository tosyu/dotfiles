return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	keys = {
		{
			"<leader>d",
			group = "Debugger",
			nowait = true,
			remap = false,
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
}
