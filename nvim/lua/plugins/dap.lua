return {
	"mfussenegger/nvim-dap",
	lazy = true,
	keys = {
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
			"<leader>dC",
			function() require("dap").run_to_cursor() end,
			desc = "Run to cursor",
		},
		{
			"<leader>dT",
			function() require("dap").terminate() end,
			desc = "Terminate",
		},
	},
}
