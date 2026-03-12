return {
	"seblyng/roslyn.nvim",
	dependencies = {"mason-org/mason.nvim"},
	config = function ()
		local mason_registry = require("mason-registry")

		if mason_registry.has_package("roslyn") then
			require("roslyn").setup({})

			vim.lsp.config("roslyn", {
				settings = {
					["csharp|inlay_hints"] = {
						csharp_enable_inlay_hints_for_implicit_object_creation = true,
						csharp_enable_inlay_hints_for_implicit_variable_types = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
				},
			})
		end
	end,
}
