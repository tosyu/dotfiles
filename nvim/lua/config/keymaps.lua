local map = vim.keymap.set

map("n", "<leader>w", "<cmd>:w<cr>", {silent = true, desc = "Write to file"}) 
map("n", "<leader>W", "<cmd>:w!<cr>", {silent = true, desc = "Force write to file"})
map("n", "<leader>h", "<cmd>:bprev<cr>", {silent = true, desc = "Previous buffer"})
map("n", "<leader>j", "<cmd>:cprev<cr>", {silent = true, desc = "Previous quickfix"})
map("n", "<leader>k", "<cmd>:cnext<cr>", {silent = true, desc = "Next quickfix"})
map("n", "<leader>l", "<cmd>:bnext<cr>", {silent = true, desc = "Next buffer"})

