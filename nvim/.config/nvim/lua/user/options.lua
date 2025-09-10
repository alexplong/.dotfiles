-- lua/user/options.lua
local o = vim.opt

-- UI
o.number        = true      -- show line numbers
o.relativenumber = true     -- relative line numbers
o.cursorline    = true      -- highlight cursor line

-- Tabs and Indentation
o.expandtab     = true      -- use spaces, not tabs
o.shiftwidth    = 2         -- size of an indent
o.tabstop       = 2         -- tabs are 2 spaces
o.softtabstop   = 2         -- editing spaces

o.smartindent  = true      -- auto-indent new lines

-- Search
o.ignorecase    = true      -- case insensitive search
o.smartcase     = true      -- unless uppercase in query

o.hlsearch      = false     -- disable persistent highlight

-- Files & Encoding
o.encoding      = "utf-8"
o.fileencoding  = "utf-8"

-- Clipboard
o.clipboard     = "unnamedplus"

-- Mouse & Split
o.mouse         = "a"       -- enable mouse
o.splitright    = true      -- vertical splits go right
o.splitbelow    = true      -- horizontal splits go below
