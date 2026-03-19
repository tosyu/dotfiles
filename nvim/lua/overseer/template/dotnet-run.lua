---@type overseer.TemplateFileDefinition

return {
	name = "dotnet run",
	builder = function (params)
		local function get_cwd()
			return vim.fs.dirname(vim.g.roslyn_nvim_selected_solution)
		end

		local args = {}

		if params.project ~= nil then
			table.insert(args, "--project")
			table.insert(args, params.project)
		end

		return {
			cmd = {"dotnet", "run"},
			args = args,
			cwd = get_cwd(),
			env = {},
			components = {"default"},
			metadata = {},
		}
	end,
	-- tags = {overseer.TAG.BUILD},
	params = {
		project = {
			type = "string",
			name = "Project",
			order = 1,
			optional = false,
			default = nil,
		},
	},
	condition = {
		filetype = {"cs", "csproj", "sln", "slnx"},
	},
}
