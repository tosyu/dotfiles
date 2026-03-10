return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	config = function()
		vim.api.nvim_create_user_command("SessionLoad", function ()
			require("persistence").load()
		end, {desc = "Load session"})

		vim.api.nvim_create_user_command("SessionSelect", function ()
			require("persistence").select()
		end, {desc = "Select session"})

		vim.api.nvim_create_user_command("SessionRestore", function ()
			require("persistence").load({last = true})
		end, {desc = "Load last session"})

		vim.api.nvim_create_user_command("SessionStop", function ()
			require("persistence").stop()
		end, {desc = "Stop session saving"})
	end,
}
