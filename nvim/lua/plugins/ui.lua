local custom_template_dir = vim.fn.stdpath("config") .. "/lua/overseer/templates";

return {
	{
		"f-person/auto-dark-mode.nvim",
		dependencies = {
			{"catppuccin/nvim", priority = 1000, lazy = false},
		},
		opts = {
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
			end,
		},
		config = function(_, opts)
			require("catppuccin").setup({
				flavour = "auto",
				background = {
					light = "latte",
					dark = "mocha",
				},
			})
			require("auto-dark-mode").setup(opts or {})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = true,
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			display = {
				done_ttl = 4,
			},
			notification = {
				window = {
					border = "single",
					x_padding = 1,
					y_padding = 1,
				},
			},
		},
		config = function (_, opts)
			require("fidget").setup(opts or {})

			vim.notify = require("fidget.notification").notify
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{"<leader>fa", mode = {"n", "x", "o"}, function() require("flash").jump() end, desc = "Flash"},
			{"<leader>fA", mode = {"n", "x", "o"}, function() require("flash").treesitter() end, desc = "Flash treesitter"},
			{"<leader>fr", mode = "o", function() require("flash").remote() end, desc = "Flash remote"},
			{"<lreader>fR", mode = {"x", "o"}, function() require("flash").treesitter_search() end, desc = "Treesitter search"},
			{"<c-s>", mode = {"c"}, function() require("flash").toggle() end, desc = "Toggle flash search"},
		},
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = {"nvim-tree/nvim-web-devicons"},
		opts = {
			ui_select = true,
			file_icons = true,
			git_icons = true,
			multiprocess = true,
		},
		keys = {
			{"<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find file"},
			{"<leader>fF", "<cmd>FzfLua global<CR>", desc = "Find anything"},
			{"<leader>fr", "<cmd>FzfLua resume<CR>", desc = "Find resume"},
			{"<leader>fg", "<cmd>FzfLua git_files<CR>", desc = "Find git file"},
			{"<leader>fc", "<cmd>FzfLua git_commits<CR>", desc = "Find git commit"},
			{"<leader>fb", "<cmd>FzfLua git_branches<CR>", desc = "Find git branch"},
			{"<leader>fs", "<cmd>FzfLua git_stash<CR>", desc = "Find git stash"},
			{"<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Find buffer"},
			{"<leader>fq", "<cmd>FzfLua quickfix<CR>", desc = "Find quickfix"},
			{"<leader>fG", "<cmd>FzfLua grep<CR>", desc = "Grep"},
			{"<leader>fl", "<cmd>FzfLua live_grep<CR>", desc = "Live grep"},
			{"<leader>fc", "<cmd>FzfLua complete_path<CR>", desc = "Complete path"},
			{"<leader>fe", "<cmd>FzfLua diagnostics_document<CR>", desc = "Diagnostics document"},
			{"<leader>fE", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "Diagnostics workspace"},
			{"<leader>fm", "<cmd>FzfLua marks<CR>", desc = "Find mark"},
			{"<leader>fk", "<cmd>FzfLua keymaps<CR>", desc = "Find mark"},
			{"<leader>fP", "<cmd>FzfLua builtin<CR>", desc = "Global Find"},
			{"<leader>fp", "<cmd>FzfLua commands<CR>", desc = "Find command"},
		},
	},
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = {"MunifTanjim/nui.nvim"},
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"stevearc/overseer.nvim",
		},
		opts = {
			sections = {
				lualine_x = {"overseer"},
			},
		},
	},
	{
		"equalsraf/neovim-gui-shim",
	},
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"esmuellert/codediff.nvim",
			"ibhagwan/fzf-lua",
		},
		cmd = "Neogit",
		keys = {
			{"<leader>G", "<cmd>Neogit<cr>", desc = "Neogit"},
		},
	},
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = {"org"},
		dependencies = {"danilshvalov/org-modern.nvim"},
		config = function()

			local menu = require("org-modern.menu")
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
				ui = {
					menu = {
						handler = function (data)
							menu:new({
								window = {
									margin = {1, 0, 1, 0},
									padding = {0, 1, 0, 1},
									title_pos = "center",
									border = "single",
									zindex = 1000,
								},
								icons = {
									separator = "➜",
								},
							}):open(data)
						end
					}
				}
			})

			vim.lsp.enable("org")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		keys = {
			{
				"<leader>`",
				"<cmd>ToggleTerm direction=horizontal size=40<cr>",
				desc = "Toggle terminal",
			},
		},
	},
	{
		"folke/which-key.nvim",
		opts = {},
		event = "VeryLazy",
		keys = {
			{"<leader>?", function() require("which-key").show({global = false}) end, desc = "Which key"}
		},
	},
	{
		"mikavilpas/yazi.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = {"nvim-lua/plenary.nvim", lazy = true},
		keys = {
			{"<leader>-", mode = {"n", "v"}, "<cmd>Yazi<cr>", desc = "Open Yazi at the current file"},
			{"<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open Yazi at cwd"},
			{"<leader>e", "<cmd>Yazi toggle<cr>", desc = "Toggle Yazi"},
		},
		opts = {
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
		init = function ()
			vim.g.loaded_netrwPlugin = 1
		end,
	},
	{
		"stevearc/overseer.nvim",
		event = "VeryLazy",
		opts = {
			task_list = {
				template_dirs = {
					custom_template_dir,
				},
				log_level = vim.log.levels.DEBUG,
			},
		},
		config = function(_, opts)
			require("overseer").setup(opts or {})

			vim.api.nvim_create_user_command("OverseerLog", function()
				local log_path = vim.fn.stdpath("state") .. "/overseer.log"
				print(log_path)
				if not vim.uv.fs_stat(log_path) then
					vim.notify("Overseer log file at " .. log_path .. " does not exist", vim.log.levels.ERROR)
					return
				end

				vim.cmd.edit(log_path)
			end, {})
		end,
		keys = {
			{ "<leader>r", "<cmd>OverseerToggle<cr>", desc = "Overseer toggle" },
			{ "<leader>rr", "<cmd>OverseerRun<cr>", desc = "Overseer run" },
			{ "<leader>rt", "<cmd>OverseerTaskAction<cr>", desc = "Overseer task action" },
			{ "<leader>rs", "<cmd>OverseerShell<cr>", desc = "Overseer shell" },
			{ "<leader>ro", "<cmd>OverseerOpen<cr>", desc = "Overseer Open" },
			{ "<leader>rc", "<cmd>OverseerClose<cr>", desc = "Overseer Close" },
		},
	},
}
