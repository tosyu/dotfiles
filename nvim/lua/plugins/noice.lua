return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependecies = {
		"MuniTanjim/nio.nvim",
		"rcarriga/nvim-notify",
	},
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_pallete = true,
		long_message_to_split = true,
		inc_renace = false,
	},
}
