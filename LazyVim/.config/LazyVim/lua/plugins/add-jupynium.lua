return {
	{
		"kiyoon/jupynium.nvim",
		build = "pip3 install --user .",
		-- Alternative build option:
		-- build = "conda run --no-capture-output -n jupynium pip install .",
		-- enabled only if the specific environment exists:
		-- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
	},
	{
		"rcarriga/nvim-notify", -- optional
	},
	{
		"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
	},
}
