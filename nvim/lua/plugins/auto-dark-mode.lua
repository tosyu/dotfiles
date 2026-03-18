return {
	"f-person/auto-dark-mode.nvim",
	dependencies = {
		{"catppuccin/nvim", priority = 1000, lazy = false},
	},
	opts = {
		set_dark_mode = function()
			vim.api.nvim_set_option_value("background", "dark", {})
		end,
		set_light_mode = function()
			vim.api.nvim_set_option_value("background", "light", {})
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup({
			flavour = "auto",
			background = {
				light = "latte",
				dark = "mocha",
			},
		})
		require("auto-dark-mode").setup(opts or {})
		vim.cmd.colorscheme("catppuccin")
	end,
}
