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

		local client = vim.lsp.get_client_by_id(client_id)

		if client == nil then
			return
		end

		if client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, {bufnr = event.buf})
		end

		if client.supports_method(vim.lsp.protocol.Methods.textDocument__inlineCompletion) and not vim.lsp.inline_completion == nil then
			vim.lsp.inline_completion.enable(true, {bufnr = event.buf})
		end

	end,
})
