local custom_template_dir = vim.fn.stdpath("config") .. "/lua/overseer/templates";

return {
	"stevearc/overseer.nvim",
	event = "VeryLazy",
	opts = {
		task_list = {
			template_dirs = {
				custom_template_dir,
			},
			log_level = vim.log.levels.DEBUG,
		},
	},
	config = function(_, opts)
		require("overseer").setup(opts or {})
	end,
	keys = {
		{ "<leader>r", "<cmd>OverseerToggle<cr>", desc = "Overseer toggle" },
		{ "<leader>rr", "<cmd>OverseerRun<cr>", desc = "Overseer run" },
		{ "<leader>rt", "<cmd>OverseerTaskAction<cr>", desc = "Overseer task action" },
		{ "<leader>rs", "<cmd>OverseerShell<cr>", desc = "Overseer shell" },
		{ "<leader>ro", "<cmd>OverseerOpen<cr>", desc = "Overseer Open" },
		{ "<leader>rc", "<cmd>OverseerClose<cr>", desc = "Overseer Close" },
	},
}
