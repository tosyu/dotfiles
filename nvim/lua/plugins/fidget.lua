return {
	"j-hui/fidget.nvim",
	opts = {
		display = {
			done_ttl = 4,
		},
		notification = {
			window = {
				border = "single",
				x_padding = 1,
				y_padding = 1,
			},
		},
	},
	config = function (_, opts)
		require("fidget").setup(opts or {})

		vim.notify = require("fidget.notification").notify
	end,
}
