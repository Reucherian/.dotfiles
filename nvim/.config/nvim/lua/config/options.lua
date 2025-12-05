vim.g.mapleader = " " -- using the space key for leader
vim.g.maplocalleader = " " -- using the space key for local leader
vim.o.hlsearch = true -- set highlight on search
vim.wo.number = true -- make line numbers default
vim.o.relativenumber = true -- setting relative line numbers
vim.o.mouse = "" -- disable mouse mode
vim.o.breakindent = true -- enable break indent
vim.o.undofile = true -- save undo history
vim.o.ignorecase = true -- case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true
vim.o.updatetime = 250 -- save swap file and trigger cursor hold
vim.o.signcolumn = "yes" -- always show the sign column otherwise it will shift the text everytime
vim.o.clipboard = "unnamedplus" -- add to the system clipboard
vim.o.completeopt = "menu,menuone,noselect" -- set completeopt to have a better completion experience
vim.o.conceallevel = 2 -- hide * markup for bold and italic, but not markers and substitutions
vim.opt.fillchars = { -- fold characters
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
vim.opt.listchars:append({ -- certain lsps (gopls) force tabs set character for those situations
	tab = "▸ ",
})
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.tabstop = 2 -- number of spaces tabs count for
vim.opt.shiftwidth = 2 -- size of an indent
vim.opt.shiftround = true -- round indent to multiple of shift width
vim.opt.cursorline = true -- enable highlighting of the current line
vim.o.foldmethod = "expr" -- use the expression for folding
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()" -- executed for every line in a buffer
vim.o.foldlevelstart = 99 -- no folds at the beginning
vim.o.foldtext = ""
vim.opt.smoothscroll = true
vim.opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
-- vim.opt.foldexpr = vim.treesitter.foldexpr() -- code is in lua/util/ui.lua
