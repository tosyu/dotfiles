return {
	"f-person/auto-dark-mode.nvim",
	dependencies = {"miikanissi/modus-themes.nvim"},
	opts = {
		set_dark_mode = function()
			vim.cmd.colorscheme("modus_vivendi")
		end,
		set_light_mode = function()
			vim.cmd.colorscheme("modus_operandi")
		end,
	},
	config = function(_, opts)
		require("modus-themes").setup({})
		require("auto-dark-mode").setup(opts or {})
	end,
}
