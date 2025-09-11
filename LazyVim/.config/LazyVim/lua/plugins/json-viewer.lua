return {
  -- Better JSON viewing and formatting
  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "ipynb" },
    cmd = { "JqxList", "JqxQuery" },
    keys = {
      { "<leader>jq", "<cmd>JqxList<cr>", desc = "JSON query list" },
      { "<leader>jr", "<cmd>JqxQuery<cr>", desc = "JSON query" },
    },
  },
  
  -- JSON formatting and syntax highlighting
  {
    "elzr/vim-json",
    ft = { "json", "ipynb" },
    config = function()
      -- Don't hide quotes in JSON files
      vim.g.vim_json_syntax_conceal = 0
    end,
  },
}