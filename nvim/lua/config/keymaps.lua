local map = vim.keymap.set

map("n", "<leader>q", "<cmd>:q<cr>", {silent = true, desc = "Quit"}) 
map("n", "<leader>Q", "<cmd>:qa!<cr>", {silent = true, desc = "Force quit"}) 
map("n", "<leader>w", "<cmd>:w<cr>", {silent = true, desc = "Write file"}) 
map("n", "<leader>W", "<cmd>:w!<cr>", {silent = true, desc = "Force write file"})

map("n", "<leader>h", "<cmd>:bprev<cr>", {silent = true, desc = "Previous buffer"})
map("n", "<leader>j", "<cmd>:cprev<cr>", {silent = true, desc = "Previous quickfix"})
map("n", "<leader>k", "<cmd>:cnext<cr>", {silent = true, desc = "Next quickfix"})
map("n", "<leader>l", "<cmd>:bnext<cr>", {silent = true, desc = "Next buffer"})

map("n", "<leader>bp", "<cmd>:bprev<cr>", {silent = true, desc = "Previous"})
map("n", "<leader>bn", "<cmd>:bnext<cr>", {silent = true, desc = "Next"})
map("n", "<leader>bq", "<cmd>:bd<cr>", {silent = true, desc = "Next"})
map("n", "<leader>bl", "<cmd>:buffers<cr>", {silent = true, desc = "List"})

map("n", "<leader>m", "<cmd>:marks<cr>", {silent = true, desc = "List marks"})

