local function get_args_from_params(solution, params)
	local args = {"--nologo"}

	if params.configuration ~= nil then
		table.insert(args, "--configuration")
		table.insert(args, params.configuration)
	end

	if params.framework ~= nil then
		table.insert(args, "--framework")
		table.insert(args, params.framework)
	end

	if params.verbosity ~= nil then
		table.insert(args, "--verbosity")
		table.insert(args, params.verbosity)
	end

	if params.settings ~= nil then
		table.insert(args, "--settings")
		table.insert(args, params.settings)
	end

	if params.filter ~= nil then
		table.insert(args, "--filter")
		table.insert(args, params.filter)
	end

	if params.blame_hang == true then
		table.insert(args, "--blame-hang")

		if params.blame_hang_timeout ~= nil then
			table.insert(args, "--blame-hang-timeout")
			table.insert(args, params.blame_hang_timeout)
		end
	end

	if params.list_tests == true then
		table.insert(args, "--list-tests")
	end

	if params.project ~= nil then
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
		local projects_common = get_projects()
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
						optional = true,
						type = "enum",
						choices = projects_common,
						name = "Project",
					},
					configuration = configuration_param,
					framework = framework_param,
					verbosity = verbosity_param,
				},
				open = true,
			}
		end

		template_defs["build"]["params"]["no_restore"] = {
			type = "boolean",
			optional = true,
			name = "Do not restore project",
		}

		template_defs["build"]["params"]["debug"] = {
			type = "boolean",
			optional = true,
			name = "Debug",
		}

		template_defs["run"]["params"]["no_build"] = {
			type = "boolean",
			optional = true,
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
					type = "boolean",
					optional = true,
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
					optional = true,
					name = "Enable blame mode",
				},
				blame_hang_timeout = {
					type = "integer",
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
