return {
	"seblyng/roslyn.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"j-hui/fidget.nvim",
	},
	config = function ()
		local mason_registry = require("mason-registry")

		if mason_registry.has_package("roslyn") then
			require("roslyn").setup({})

			vim.lsp.config("roslyn", {
				settings = {
					["csharp|inlay_hints"] = {
						csharp_enable_inlay_hints_for_implicit_object_creation = false,
						csharp_enable_inlay_hints_for_implicit_variable_types = false,
						csharp_enable_inlay_hints_for_lambda_parameter_types = true,
						csharp_enable_inlay_hints_for_object_creation_parameters = true,
						csharp_enable_inlay_hints_for_other_parameters = true,
						csharp_enable_inlay_hints_for_parameters = true,
						csharp_enable_inlay_hints_for_types = true,
						dotnet_enable_inlay_hints_for_indexer_parameters = true,
						dotnet_enable_inlay_hints_for_literal_parameters = true,
						dotnet_enable_inlay_hints_for_object_creation_parameters = true,
						dotnet_enable_inlay_hints_for_other_parameters = true,
						dotnet_enable_inlay_hints_for_parameters = false,
						dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
						dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
						dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
						dotnet_enable_tests_code_lens = true,
					},
					["csharp|symbol_search"] = {
						dotnet_search_reference_assemblies = true,
					},
					["csharp|background_analysis"] = {
						background_analysis = {
							dotnet_analyzer_diagnostics_scope = "fullSolution",
							dotnet_compiler_diagnostics_scope = "fullSolution",
						},
					},
					["csharp|completion"] = {
						dotnet_show_completion_items_from_unimported_namespaces = true,
						dotnet_show_name_completion_suggestions = true,
					},
				},
			})
		end
	end,
}
