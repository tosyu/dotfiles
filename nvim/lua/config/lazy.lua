local lazy_data_directory = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazy_data_directory) then
	local lazy_repository = "https://github.com/folke/lazy.nvim.git"
	local git_result = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazy_repository, lazy_data_directory})

	if vim.v.shell_error ~= 0 then
		vim.api.echo({
				{"Failed to clone lazy.nvim\n", "ErrorMsg"},
				{out, "WarningMsg"},
				{"\nPress any key to exit..."},
		})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazy_data_directory)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
		autocmds = true,
		spec = {
			{"LazyVim/LazyVim"},
			{import = "plugins"},
		},
		keymaps = true,
		autocmds = true,
		install = {colorscheme = {"habamax"}},
		checker = {enabled = true},
})

vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", {silent = true, desc = "Open Lazy"})
