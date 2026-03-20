return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"stevearc/overseer.nvim",
	},
	opts = {
		sections = {
			lualine_x = {"overseer"},
		},
	},
}
