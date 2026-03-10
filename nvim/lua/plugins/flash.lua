return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{"<leader>fa", mode = {"n", "x", "o"}, function() require("flash").jump() end, desc = "Flash"},
		{"<leader>fA", mode = {"n", "x", "o"}, function() require("flash").treesitter() end, desc = "Flash treesitter"},
		{"<leader>fr", mode = "o", function() require("flash").remote() end, desc = "Flash remote"},
		{"<lreader>fR", mode = {"x", "o"}, function() require("flash").treesitter_search() end, desc = "Treesitter search"},
		{"<c-s>", mode = {"c"}, function() require("flash").toggle() end, desc = "Toggle flash search"},
	},
}
