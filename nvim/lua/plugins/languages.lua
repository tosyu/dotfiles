local function create_lsp_autocmd()
	vim.api.nvim_create_autocmd("LSpAttach", {
		desc = "Configure lsp autocomplete and hints",
		callback = function (event)
			local client_id = vim.tbl_get(event, "data", "client_id")

			if client_id == nil then
				return
			end

			vim.lsp.completion.enable(true, client_id, event.buf, {autotrigger = false})

			local map = vim.keymap.set

			map("n", "<leader>ca", vim.lsp.buf.code_action, {silent = true, desc = "Code action", buffer = event.buf})
			map("n", "<leader>cr", vim.lsp.buf.rename, {silent = true, desc = "Rename", buffer = event.buf})
			map("n", "<leader>cf", vim.lsp.buf.format, {silent = true, desc = "Format document", buffer = event.buf})
			map("n", "gD", vim.lsp.buf.declaration, {silent = true, desc = "Go to declaration", buffer = event.buf})
			map("n", "<leader>cd", vim.diagnostic.open_float, {silent = true, desc = "Open diagnostic window", buffer = event.buff})

			local client = vim.lsp.get_client_by_id(client_id)

			if client == nil then
				return
			end

			if client.supports_method("textDocument/inlayHint") then
				vim.lsp.inlay_hint.enable(true, {bufnr = event.buf})
			end

			if vim.lsp.code_lens ~= nil and not vim.lsp.code_lens.is_enabled({bufnr = event.buf}) then
				vim.lsp.code_lens.enable(true, {bufnr = event.buf})
			end

			if client.supports_method(vim.lsp.protocol.Methods.textDocument__inlineCompletion) and not vim.lsp.inline_completion == nil then
				vim.lsp.inline_completion.enable(true, {autotrigger = true, bufnr = event.buf})
			end

		end,
	})
end

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
				"dotenv-linter",
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
	{
		"neovim/nvim-lspconfig",
		dependencies = {"mason-org/mason.nvim"},
		opts = {
			inlay_hints = {enable = true},
		},
		init = function()
			vim.o.signcolumn = "yes"
		end,
		config = function()
			local mason_registry = require("mason-registry")

			vim.lsp.config("*", {
				root_markers = {".git"},
			})

			create_lsp_autocmd();

			-- vim.lsp.set_log_level("debug")
			
			vim.api.nvim_create_user_command("LSPLog", function()
				vim.cmd.edit(vim.lsp.get_log_path())
			end, {})

			if mason_registry.has_package("pyright") then
				vim.lsp.enable("pyright")
			end

			if mason_registry.has_package("css-lsp") then
				vim.lsp.enable("cssls")
			end

			if mason_registry.has_package("cssmodules-language-server") then
				vim.lsp.enable("cssmodules_ls")
			end

			if mason_registry.has_package("asm-lsp") then
				vim.lsp.enable("asm_lsp")
			end

			if mason_registry.has_package("vim-language-server") then
				vim.lsp.enable("vimls")
			end

			if mason_registry.has_package("clangd") then
				vim.lsp.enable("clangd")
			end

			if mason_registry.has_package("lua-language-server") then
				local lua_lsp_binary = vim.fn.expand("$MASON/bin/lua-language-server")
				vim.lsp.config("lua_ls", {
					cmd = {
						lua_lsp_binary,
						"--stdio"
					},
					settings = {
						Lua = {
							diagnostics = {
								enable = true,
								globals = {"hs", "vim", "it", "describe", "before_each", "after_each"},
							},
						},
					}
				})
				vim.lsp.enable("lua_ls")
			end

			if mason_registry.has_package("glsl_analyzer") then
				vim.lsp.enable("glsl_analyzer")
			end

			if mason_registry.has_package("docker-compose-language-service") then
				vim.lsp.enable("docker-compose-langserver")
			end

			if mason_registry.has_package("markdown-oxide") then
				vim.lsp.enable("markdown_oxide")
			end

			if mason_registry.has_package("json-lsp") then
				vim.lsp.enable("jsonls")
			end

			if mason_registry.has_package("docker-language-server") then
				vim.lsp.enable("docker_language_server")
			end

			if mason_registry.has_package("html-lsp") then
				vim.lsp.enable("html")
			end

			if mason_registry.has_package("rust-analyzer") then
				vim.lsp.enable("rust_analyzer")
			end

			if mason_registry.has_package("systemd-lsp") then
				vim.lsp.enable("systemd_lsp")
			end

			if mason_registry.has_package("vue-language-server") then
				vim.lsp.enable("vue_ls")
			end

			if mason_registry.has_package("bash-language-server") then
				vim.lsp.enable("bashls")
			end

			if mason_registry.has_package("cmake-language-server") then
				vim.lsp.enable("cmake")
			end

			if mason_registry.has_package("yaml-language-server") then
				vim.lsp.enable("yamlls")
			end

			if mason_registry.has_package("vtsls") then
				vim.lsp.enable("vtsls")
			end

			if mason_registry.has_package("sqls") then
				vim.lsp.enable("sqls")
			end

			if mason_registry.has_package("taplo") then
				vim.lsp.enable("toml")
			end

			if mason_registry.has_package("zls") then
				vim.lsp.enable("zls")
			end
		end,
	},
}
