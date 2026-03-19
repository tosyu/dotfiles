---@type overseer.TemplateFileDefinition

return {
	name = "dotnet build",
	builder = function (params)
		local function get_cwd()
			return vim.fs.dirname(vim.g.roslyn_nvim_selected_solution)
		end

		return {
			cmd = {"dotnet", "build"},
			args = {},
			cwd = get_cwd(),
			env = {},
			components = {"default"},
			metadata = {},
		}
	end,
	-- tags = {overseer.TAG.BUILD},
	params = {},
	condition = {
		filetype = {"cs", "csproj", "sln", "slnx"},
	},
}
