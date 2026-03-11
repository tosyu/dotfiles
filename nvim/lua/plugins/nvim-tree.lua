return {
	"nvim-tree/nvim-tree.lua",
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true
	end,
	opts = {
		view = {
			width = 40,
		},
		renderer = {
			group_empty = true,
		},
		sort = {
			sorter = "case_sensitive",
		},
		update_focused_file = {
			enable = true,
		},
		bookmarks = {
			persist = true,
		},
	},
	keys = {
		{"<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File explorer" },
		{
			"<leader>E",
			function ()
				require("nvim-tree.api").tree.find_file({open=true, focus=true})
			end,
			desc = "File explorer"
		},
	},
}
