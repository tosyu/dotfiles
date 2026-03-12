return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	dependencies = { "rafamadriz/friendly-snippets" },
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")

		ls.setup({})

		local map = vim.keymap.set

		map({"i"}, "<C-k>", function() ls.expand() end, {silent = true})
		map({"i", "s"}, "<C-l>", function() ls.jump(1) end, {silent = true})
		map({"i", "s"}, "<C-j>", function() ls.expand(-1) end, {silent = true})
		map({"i", "s"}, "<C-e>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, {silent = true})

		local snippets_dir = vim.fn.stdpath("config") .. "/lua/snippets";

		require("luasnip.loaders.from_lua").lazy_load({
			paths = {
				snippets_dir
			}
		})
	end,
}
