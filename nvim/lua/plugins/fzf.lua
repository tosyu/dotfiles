return {
	"ibhagwan/fzf-lua",
	opts = {},
	keys = {
		{"<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find file"},
		{"<leader>fg", "<cmd>FzfLua git_files<CR>", desc = "Find git file"},
		{"<leader>fc", "<cmd>FzfLua git_commits<CR>", desc = "Find git commit"},
		{"<leader>fb", "<cmd>FzfLua git_branches<CR>", desc = "Find git branch"},
		{"<leader>fs", "<cmd>FzfLua git_stash<CR>", desc = "Find git stash"},
	},
}
