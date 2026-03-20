return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"stevearc/overseer.nvim",
	},
	config = function(_, opts)
		local opts = {
			consumers = {
				overseer = require("neotest.consumers.overseer"),
			},
			overseer = {
				enabled = true,
				force_default = false,
			},
		}
		require("neotest").setup(opts or {})
	end,
	keys = {
		{
			"<leader>t",
			group = "Test",
			nowait = true,
			remap = false,
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run tests in current file",
		},
		{
			"<leader>ta",
			function()
				require("neotest").run.run()
			end,
			desc = "Run all tests",
		},
		{
			"<leader>td",
			function ()
				require("neotest").run.run({strategy = "dap"})
			end,
			desc = "Debug nearest test",
		},
		{
			"<leader>ts",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop tests",
		}
	},
}
