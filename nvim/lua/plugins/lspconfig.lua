local function create_autocmds()
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
				vim.lsp.inline_completion.enable(true, {bufnr = event.buf})
			end

		end,
	})
end

return {
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

		create_autocmds();

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
	end,
}
