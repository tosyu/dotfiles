return {
	"kungfusheep/snipe-lsp.nvim",
	event = "VeryLazy",
	dependencies = {
		"leath-dub/snipe.nvim",
	},
	opts = {
		keymap = {
			open_symbols_menu = "<leader>l",
			open_symbols_menu_for_split = "<leader>ls",
			open_symbols_menu_for_vsplit = "<leader>lv",
		},
	},
}
