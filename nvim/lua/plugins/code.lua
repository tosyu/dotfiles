return {
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"nmac427/guess-indent.nvim",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "^4.0.0",
		event = "VeryLazy",
	},
	{
		"mfussenegger/nvim-lint",
		config = function ()
			local lint = require("lint")

			local function setup_lint_for_pattern(patterns, filetype, linter)
				lint.linters_by_ft[filetype] = linter

				vim.api.nvim_create_autocmd({"BufWritePost"}, {
					pattern = patterns,
					callback = function ()
						lint.try_lint();
					end
				})
			end

			setup_lint_for_pattern({"md"}, "markdown", "markdownlint")
			setup_lint_for_pattern({"cs"}, "cs", "dotenv-linter")
			setup_lint_for_pattern({"cmake"}, "cmake", "cmakelint")
			setup_lint_for_pattern({"yml"}, "yaml", "yamlint")
			setup_lint_for_pattern({"cpp"}, "cpp", "cpplint")
			setup_lint_for_pattern({"json"}, "json", "jsonlint")
			setup_lint_for_pattern({"html", "htm", "xhtml"}, "html", "htmlhint")
			setup_lint_for_pattern({"editorconfig"}, "editorconfig", "editorconfig-checker")
			setup_lint_for_pattern({"py"}, "python", "pylint")
			setup_lint_for_pattern({"lua"}, "lua", "luacheck")
		end
	},
}
