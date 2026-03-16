return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = {
		{"nvim-mini/mini.icons", opts = {}},
	},
	lazy = false,
	keys = {
		{"<leader>O", "<cmd>Oil<cr>", desc = "Oil file manager"},
	},
}
