return {
	"akinsho/bufferline.nvim",
	dependencies = {"nvim-tree/nvim-web-devicons"},
	init = function ()
		vim.opt.termguicolors = true
	end,
	config = true,
	opts = {
		-- diagnostics = "nvim_lsp",
	},
}
