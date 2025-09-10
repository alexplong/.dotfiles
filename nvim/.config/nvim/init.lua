-- init.lua
-- Load user modules
-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data").."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Core modules
require("user.options")   -- your vim.o and vim.opt settings
require("user.keymaps")   -- your custom mappings
require("user.plugins")   -- plugin specs (below)


