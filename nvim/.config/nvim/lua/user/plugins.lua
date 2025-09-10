-- lua/user/plugins.lua
return require("lazy").setup({
  -- Essential libraries
  { "nvim-lua/plenary.nvim" },

  -- File explorer: mini.files
  {
    "echasnovski/mini.files",
    keys = {
      { "<leader>e", function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end, desc = "Open mini.files (file)" },
      { "<leader>E", function()
          require("mini.files").open(vim.loop.cwd(), true)
        end, desc = "Open mini.files (cwd)" },
      { "<leader>fm", function()
          require("mini.files").open(require("lazy").root(), true)
        end, desc = "Open mini.files (LazyVim root)" },
    },
  },

  -- Auto-completion: nvim-cmp with custom mappings
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<Right>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"]    = function(fallback)
          cmp.abort()
          fallback()
        end,
      })
      return opts
    end,
  },

  -- Fuzzy finder: telescope.nvim with no_ignore defaults
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = { file_ignore_patterns = {},
                   -- you can also set `no_ignore=true` per-pick
      },
    },
    keys = {
      { "<leader><leader>", "<cmd>Telescope find_files no_ignore=true<CR>",  desc = "Find files (all)" },
      { "<leader>ff",        "<cmd>Telescope find_files no_ignore=true<CR>",  desc = "Find files (all)" },
      { "<leader>fF",        "<cmd>Telescope find_files cwd=false hidden=true no_ignore=false<CR>", desc = "Find files (cwd)" },
    },
  },

  -- Jupyter integration: jupynium.nvim
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    dependencies = { "rcarriga/nvim-notify", "stevearc/dressing.nvim" },
  },

  -- Dashboard: dashboard-nvim
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = function()
      local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      local opts = {
        theme = "doom",
        hide = { statusline = false },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { action = 'Telescope find_files no_ignore=true',    desc = " Find File",       icon = " ", key = "f" },
            { action = 'ene | startinsert',                      desc = " New File",        icon = " ", key = "n" },
            { action = 'lua require("lazy").pick("oldfiles")()', desc = " Recent Files",    icon = " ", key = "r" },
            { action = 'lua require("lazy").pick("live_grep")()', desc = " Find Text",       icon = " ", key = "g" },
            { action = 'lua require("lazy").pick.config_files()()', desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',     desc = " Restore Session", icon = " ", key = "s" },
            { action = 'LazyExtras',                             desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = 'Lazy',                                   desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }
      return opts
    end,
  },

  -- Classic plugins
  { "tpope/vim-surround" },
  { "preservim/nerdtree" },
  { "preservim/tagbar" },
  { "vim-airline/vim-airline" },
  { "christoomey/vim-tmux-navigator" },
  { "ryanoasis/vim-devicons" },
  { "rafi/awesome-vim-colorschemes" },
  { "chriskempson/base16-vim" },
  { "dracula/vim", name = "dracula" },
  { "tpope/vim-fugitive" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})

