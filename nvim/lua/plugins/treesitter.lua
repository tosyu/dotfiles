return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {"mason-org/mason.nvim"},
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
}
