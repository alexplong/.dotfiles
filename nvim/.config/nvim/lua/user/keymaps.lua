-- lua/user/keymaps.lua
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better escape via plugin (max397574/better-escape.nvim) maps jk/kj by default

-- NERDTree-like explorer (mini.files)
keymap("n", "<leader>e", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "Explore file (mini.files)" })
keymap("n", "<leader>E", function()
  require("mini.files").open(vim.loop.cwd(), true)
end, { desc = "Explore cwd (mini.files)" })

-- Tagbar
keymap("n", "<F8>", ":TagbarToggle<CR>", opts)

-- Telescope (use command strings to avoid requiring module at init time)
keymap("n", "<leader>ff", "<cmd>Telescope find_files no_ignore=true<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Clear search
keymap("n", "<CR>", ":noh<CR><CR>", opts)

-- Save with sudo
keymap("c", "w!!", "%!sudo tee > /dev/null %", { desc = 'Save file as sudo' })

