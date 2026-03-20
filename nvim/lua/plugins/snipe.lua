return {
	"leath-dub/snipe.nvim",
	opts = {
		ui = {
			open_win_override = {
				border = "rounded",
			}
		},
	},
	keys = {
		{"<leader>B", function() require("snipe").open_buffer_menu() end, desc = "Open buffer menu"},
	},
}
