return {
	"neovim/nvim-lspconfig",
	dependencies = {"mason-org/mason.nvim"},
	opts = {},

	init = function()
		vim.o.signcolumn = "yes"
	end,
	config = function()
		local mason_registry = require("mason-registry")

		vim.lsp.config("*", {
			root_markers = {".git"},
		})

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
			vim.lsp.config("lua", {
				cmd = {
					lua_lsp_binary,
					"--stdio"
				},
				filetypes = {"lua"},
			})
			vim.lsp.enable("lua")
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
	end,
}
