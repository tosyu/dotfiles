return {
	"jay-babu/mason-nvim-dap.nvim",
	opts = {
		ensure_installed = {
			"netcoredbg",
		},
		automatic_installation = true,
		handlers = {
			function(config)
				require("mason-nvim-dap").default_setup(config)
			end,
		},
	},
}

