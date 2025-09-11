return {
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    -- Alternative build option:
    -- build = "conda run --no-capture-output -n jupynium pip install .",
    -- enabled only if the specific environment exists:
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
    ft = { "ipynb", "python" },
    opts = {
      python_host = { "python3", "-m", "jupynium", "--notebook-dir", vim.fn.getcwd() },
      default_notebook_URL = "localhost:8888",
    },
    keys = {
      { "<leader>jk", "<cmd>JupyniumKernelSelect<cr>", desc = "Jupyter Kernel Select" },
      { "<leader>js", "<cmd>JupyniumStartAndAttachToServer<cr>", desc = "Jupyter Start Server" },
      { "<leader>jr", "<cmd>JupyniumStartSync<cr>", desc = "Jupyter Start Sync" },
      { "<leader>jx", "<cmd>JupyniumExecuteSelectedCells<cr>", desc = "Jupyter Execute Selected", mode = { "n", "v" } },
      { "<leader>jc", "<cmd>JupyniumClearSelectedCellsOutputs<cr>", desc = "Jupyter Clear Output" },
      { "<leader>ja", "<cmd>JupyniumExecuteAllCells<cr>", desc = "Jupyter Execute All" },
      { "<leader>jo", "<cmd>JupyniumKernelHover<cr>", desc = "Jupyter Hover" },
      { "<leader>jq", "<cmd>JupyniumKernelInterrupt<cr>", desc = "Jupyter Interrupt" },
      { "<leader>jR", "<cmd>JupyniumKernelRestart<cr>", desc = "Jupyter Restart Kernel" },
    },
  },
  {
    "rcarriga/nvim-notify", -- optional
  },
  {
    "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
  },
}