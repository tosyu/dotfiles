return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	keys = {
		{
			"<leader>`",
			"<cmd>ToggleTerm direction=horizontal size=40<cr>",
			desc = "Toggle terminal",
		},
	},
}
