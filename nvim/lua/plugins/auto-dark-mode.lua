return {
	"f-person/auto-dark-mode.nvim",
	dependencies = {"miikanissi/modus-themes.nvim"},
	opts = {
		set_dark_mode = function()
			vim.cmd.colorscheme("modus_vivendi")
		end,
		sete_light_mode = function()
			vim.cmd.colorscheme("modus_operandi")
		end,
	},
}
