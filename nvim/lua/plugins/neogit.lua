return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"esmuellert/codediff.nvim",
		"ibhagwan/fzf-lua",
	},
	cmd = "Neogit",
	keys = {
		{"<leader>G", "<cmd>Neogit<cr>", desc = "Neogit"},
	},
}
