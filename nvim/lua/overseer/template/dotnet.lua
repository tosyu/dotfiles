local function is_nil_or_empty(str)
	return str == nil or str == ""
end

local function is_nil_or_zero(par)
	return par == nil or par == 0
end

local function get_args_from_params(solution, params)
	local args = {"--nologo"}

	if not is_nil_or_empty(params.configuration) then
		table.insert(args, "--configuration")
		table.insert(args, params.configuration)
	end

	if not is_nil_or_empty(params.framework) then
		table.insert(args, "--framework")
		table.insert(args, params.framework)
	end

	if not is_nil_or_empty(params.verbosity) then
		table.insert(args, "--verbosity")
		table.insert(args, params.verbosity)
	end

	if not is_nil_or_empty(params.settings) then
		table.insert(args, "--settings")
		table.insert(args, params.settings)
	end

	if not is_nil_or_empty(params.filter) then
		table.insert(args, "--filter")
		table.insert(args, params.filter)
	end

	if params.blame_hang == true then
		table.insert(args, "--blame-hang")

		if not is_nil_or_zero(params.blame_hang_timeout) then
			table.insert(args, "--blame-hang-timeout")
			table.insert(args, params.blame_hang_timeout)
		end
	end

	if params.list_tests == true then
		table.insert(args, "--list-tests")
	end

	if not is_nil_or_empty(params.project) then
		table.insert(args, "--project")
		table.insert(args, params.project)
	else
		table.insert(args, solution)
	end

	if params.no_build == true then
		table.insert(args, "--no-build")
	end

	if params.no_restore == true then
		table.insert(args, "--no-restore")
	end

	if params.debug == true then
		table.insert(args, "--debug")
	end

	return args
end

local function get_tasks_for_solution(solution, callback)
		local function get_cwd()
			return vim.fs.dirname(solution)
		end

		local function get_projects()
			local sln_data = vim.fn.readblob(solution)
			local ret = {}
			local offset = 1
			-- TODO this loop is horrible and weird, fix!
			while true do
				local project_line_match = vim.fn.match(sln_data, "Project", offset)

				if project_line_match == -1 or offset == project_line_match then
					break
				end

				offset = project_line_match

				local project_start_match = vim.fn.match(sln_data, '= "', project_line_match)

				if project_start_match == -1 then
					goto continue
				end

				local project_end_match = vim.fn.match(sln_data, '"', project_start_match + 3)

				if project_start_match == -1 then
					goto continue
				end

				table.insert(ret, sln_data:sub(project_start_match + 4, project_end_match))

				offset = project_end_match

				::continue::
			end

			print(vim.inspect(ret))

			return ret
		end

		local template_defs = {}
		local commands = {"build", "run", "test"}
		local projects = get_projects()
		local common_components = {
			"default",
			"on_complete_notify",
			{"open_output", focus = true},
		}

		local configuration_param = {
			optional = true,
			type = "string",
			name = "Configuration",
		}

		local framework_param = {
			optional = true,
			type = "string",
			name = "Framework",
		}

		local verbosity_param = {
			optional = true,
			default = "normal",
			type = "enum",
			name = "Verbosity level",
			choices = {"quiet", "minimal", "normal", "detailed", "diagnostic"},
		}

		for _, cmd in pairs(commands) do
			template_defs[cmd] = {
				name = "dotnet " .. cmd,
				builder = function(params)
					local args = get_args_from_params(solution, params)

					return {
						name = "dotnet " .. cmd,
						cmd = {"dotnet", cmd},
						cwd = get_cwd(),
						env = {},
						args = args,
						components = common_components,
						metadata = {},
					}
				end,
				params = {
					project = {
						type = "enum",
						choices = projects,
						name = "Project",
						optional = true,
					},
					configuration = configuration_param,
					framework = framework_param,
					verbosity = verbosity_param,
				},
			}
		end

		template_defs["build"]["params"]["no_restore"] = {
			type = "boolean",
			name = "Do not restore project",
			default = false,
		}

		template_defs["build"]["params"]["debug"] = {
			type = "boolean",
			name = "Debug",
			default = false,
		}

		template_defs["run"]["params"]["no_build"] = {
			type = "boolean",
			default = false,
			name = "Do not build project",
		}

		template_defs["test"] = {
			name = "dotnet test",
			open = true,
			builder = function(params)
				local args = get_args_from_params(solution, params)

				return {
					cmd = {"dotnet", "test"},
					cwd = get_cwd(),
					args = args,
					components = common_components,
					metadata = {},
				}
			end,
			params = {
				configuration = configuration_param,
				framework = framework_param,
				verbosity = verbosity_param,
				list_tests = {
					optional = true,
					type = "boolean",
					default = false,
					name = "List tests",
				},
				settings = {
					type = "text",
					optional = true,
					name = "Settings file",
				},
				filter = {
					type = "text",
					optional = true,
					name = "Filter tests",
				},
				blame_hang = {
					type = "boolean",
					default = false,
					optional = true,
					name = "Enable blame mode",
				},
				blame_hang_timeout = {
					type = "integer",
					default = 0,
					optional = true,
					name = "Per-test timeout in blame mode",
				},
			},
		}

		local templates = {}
		for _, template in pairs(template_defs) do
			table.insert(templates, template)
		end

		return callback(templates)
end

---@type overseer.TemplateFileProvider
return {
	name = "dotnet template provider",
	generator = function(search, callback)
		if not vim.fn.executable("dotnet") then
			return "Task not available due to dotnet binary missing"
		end

		local solution = vim.g.roslyn_nvim_selected_solution

		if solution == nil then
			return "Task not available, solution not set"
		end

		get_tasks_for_solution(solution, callback)
	end,
	condition = {
		filetype = {"cs"},
	},
}
