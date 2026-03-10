return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	ft = {"org"},
	dependencies = {"danilshvalov/org-modern.nvim"},
	config = function()

		local menu = require("org-modern.menu")
		require("orgmode").setup({
			org_agenda_files = "~/orgfiles/**/*",
			org_default_notes_file = "~/orgfiles/refile.org",
			ui = {
				menu = {
					handler = function (data)
						menu:new({
							window = {
								margin = {1, 0, 1, 0},
								padding = {0, 1, 0, 1},
								title_pos = "center",
								border = "single",
								zindex = 1000,
							},
							icons = {
								separator = "➜",
							},
						}):open(data)
					end
				}
			}
		})

		vim.lsp.enable("org")
	end,
}
