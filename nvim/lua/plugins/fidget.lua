return {
	"j-hui/fidget.nvim",
	opts = {
		display = {
			done_ttl = 4,
		},
		window = {
			border = "rounded",
		},
	},
	config = function (_, opts)
		require("fidget").setup(opts or {})

		vim.notify = require("fidget.notification").notify
	end,
}
