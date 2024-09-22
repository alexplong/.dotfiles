return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- enable finding hidden/dot files
    {
      "<leader><leader>",
			"<cmd>Telescope find_files no_ignore=true<CR>",
      desc = "Find files (root dir)",
    },
    {
      "<leader>ff",
			"<cmd>Telescope find_files no_ignore=true<CR>",
      desc = "Find files (root dir)",
    },
    {
      "<leader>fF",
      "<cmd>Telescope find_files cwd=false hidden=true no_ignore=false<CR>",
      desc = "Find files (cwd)",
    },
  },
}
