return {
	"nvim-tree/nvim-tree.lua",
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true
	end,
	opts = {
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		sort = {
			sorter = "case_sensitive",
		},
	},
	keys = {
		{"<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File explorer" },
	},
}
