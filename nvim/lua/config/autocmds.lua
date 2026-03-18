vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Highlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank {higroup = "IncSearch", timeout = 500}
	end
})

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
