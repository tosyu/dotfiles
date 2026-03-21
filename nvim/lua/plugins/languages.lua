return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
		},
		opts = {
			registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
			},
			ensure_installed = {
				"codelldb",
				"debugpy",
				"netcoredbg",
				"sqls",
				"vtsls",
				"yaml-language-server",
				"cmake-language-server",
				"vue-language-server",
				"systemd-lsp",
				"rust-analyzer",
				"html-lsp",
				"docker-language-server",
				"docker-compose-language-service",
				"json-lsp",
				"glsl_analyzer",
				"markdown-oxide",
				"lua-language-server",
				"clangd",
				"vim-language-server",
				"asm-lsp",
				"cssmodules-language-server",
				"css-lsp",
				"pyright",
				"zls",
				"cmakelint",
				"cpplint",
				"dotenv-checker",
				"editorconfig-checker",
				"htmlhint",
				"jsonlint",
				"luacheck",
				"markdownlint",
				"pylint",
				"yamllint",
			},
		},
		config = function(_, opts)
			local mason = require("mason")

			mason.setup(opts)

			local mason_dap = require("mason-nvim-dap")
			mason_dap.setup({
				handlers = {
					function(config)
						mason_dap.default_setup(config)
					end,
				},
			})

			local mason_registry = require("mason-registry")

			local install = vim.tbl_filter(function (package)
				return not mason_registry.has_package(package)
			end, opts.ensure_installed or {})

			if #install > 0 then
				for _, package in pairs(install) do
					vim.cmd(":MasonInstall " .. package)
				end
			end
		end,
		keys = {
			{"<leader>M", "<cmd>Mason<cr>", desc = "Open Mason"},
		},
	},
	{
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
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"mason-org/mason.nvim",
			{"nvim-treesitter/nvim-treesitter-textobjects", branch = "main"},
		},
		lazy = false,
		branch = "main",
		version = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"asm",
				"arduino",
				"awk",
				"c_sharp",
				"comment",
				"cmake",
				"cpp",
				"diff",
				"dot",
				"gdscript",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"glsl",
				"go",
				"html",
				"java",
				"javascript",
				"json",
				"llvm",
				"lua",
				"make",
				"markdown",
				"mermaid",
				"nginx",
				"passwd",
				"powershell",
				"printf",
				"python",
				"razor",
				"readline",
				"regex",
				"rust",
				"scss",
				"ssh_config",
				"strace",
				"tmux",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"yaml",
				"zsh",
				"toml",
				"zig",
			},
			install_dir = vim.fn.stdpath("data") .. "/site",
			indent = {enable = true},
			highlight = {enable = true},
			folds = {enable = true},
		},
		event = {"BufReadPre", "VeryLazy"},
		cmd = {"TSUpdate", "TSInstall", "TSLog", "TSUninstall"},
		opts_extend = {"ensure_installed"},
		init = function ()
			vim.g.no_plugin_maps = true
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			-- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			-- vim.wo[0][0].foldmethod = "expr"
		end,
		config = function (_, opts)
			local ts = require("nvim-treesitter")
			local mason_registry = require("mason-registry")
			local installed = ts.get_installed("parsers")

			ts.setup(opts)

			local install = vim.tbl_filter(function (lang)
				return installed[lang] == nil
			end, opts.ensure_installed or {})

			if #install > 0 and mason_registry.has_package("tree-sitter-cli") then
				ts.install(install)
			end

			for _, lang in pairs(installed) do
				vim.treesitter.language.add(lang)
				local file_types = vim.treesitter.language.get_filetypes(lang)

				vim.api.nvim_create_autocmd("FileType", {
					pattern = file_types,
					callback = function()
						vim.treesitter.start()
					end
				})
			end
		end,
	},
	{
		"https://codeberg.org/ziglang/zig.vim",
	},
}
