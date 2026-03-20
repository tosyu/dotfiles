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

		vim.api.nvim_create_user_command("OverseerLog", function()
			local log_path = vim.fn.stdpath("state") .. "/overseer.log"
			print(log_path)
			if not vim.uv.fs_stat(log_path) then
				vim.notify("Overseer log file at " .. log_path .. " does not exist", vim.log.levels.ERROR)
				return
			end

			vim.cmd.edit(log_path)
		end, {})
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
