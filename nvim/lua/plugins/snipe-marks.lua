return {
	"nicholasxjy/snipe-marks.nvim",
	dependencies = {
		"leath-dub/snipe.nvim",
	},
	keys = {
		{"<leader>ma", function() require("snipe-marks").open_marks_menu("all") end, desc = "Find marks"},
		{"<leader>ml", function() require("snipe-marks").open_marks_menu() end, desc = "Find local marks"},
	},
}
