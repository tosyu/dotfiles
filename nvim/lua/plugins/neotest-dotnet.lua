return {
	"Issafalcon/neotest-dotnet",
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-dotnet")
			},
		})
	end,
}
