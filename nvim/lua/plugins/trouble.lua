return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{"<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics"},
		{"<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)"},
		{"<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols"},
		{"<leader>ta", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Def/ref/.."},
		{"<leader>tl", "<cmd>Trouble loglist toggle<cr>", desc = "Loclist"},
		{"<leader>tq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix"},
	},
}
