return {
	"f-person/auto-dark-mode.nvim",
	opts = {
		set_dark_mode = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
		sete_light_mode = function()
			vim.cmd.colorscheme("tokyonight-day")
		end,
	},
}
