return {
	"mason-org/mason.nvim",
	opts = {
		registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
		ensure_installed = {
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
		},
	},
	config = function(_, opts)
		local mason = require("mason")

		mason.setup(opts)

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
}
