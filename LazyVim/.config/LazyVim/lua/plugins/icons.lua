return {
  -- Ensure mini.icons is configured with fallbacks
  {
    "echasnovski/mini.icons",
    opts = {
      -- Use default icons but ensure fallback
      style = "glyph", -- Use glyphs (nerd font icons)
    },
    config = function(_, opts)
      require("mini.icons").setup(opts)
      -- Ensure MiniIcons are registered as the icon provider
      MiniIcons.mock_nvim_web_devicons()
    end,
  },
  
  -- Configure nvim-web-devicons as a fallback
  {
    "nvim-tree/nvim-web-devicons",
    optional = true,
    opts = function()
      -- Only configure if mini.icons isn't available
      if not LazyVim.has("mini.icons") then
        return {
          default = true,
        }
      end
    end,
  },
}