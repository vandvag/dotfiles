local options = {
	-- General
  background = 'dark',
  mouse = "a",
  timeoutlen = 100, -- time to wait for a mapped sequence to complete (in ms)
  -- Files, Backup, Undo
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (default = 4000ms)
  writebackup = false, -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	backup = false, -- creates a backup file (everything is source controlled)
  swapfile = false, -- no swap file
  lazyredraw = true, -- good performance config

	-- UI Settings
	number = true,
	relativenumber = true,
	showmode = false, -- Since we are using LuaLine
	laststatus = 2, -- 2 -> Always show statusline
	cursorline = false, -- Hightlight the cursor line
	cmdheight = 2, -- more space in the neovim command line for displaying messages
  showtabline = 2, -- always show tabs
  splitbelow = true, -- force all horizontal splits to appear to the bottom
  splitright = true, -- force all vertical splits to appear to the right
  wrap = false, -- display lines in one long line
  scrolloff = 8,
  sidescrolloff = 8,
  pumheight = 10,
  termguicolors = true,
	-- Indenting behavior
	expandtab = false, -- true -> convert tabs to spaces
	-- tabstop = 4, -- insert 4 spaces for a tab
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	smarttab = true,
  smartindent = true,
	-- Searching
	hlsearch = true,
	ignorecase = true,
	clipboard = "unnamedplus",
	completeopt = { "menuone", "noselect" }, -- mostly for cmp
	conceallevel = 0,
	fileencoding = "utf-8",
	colorcolumn = "120",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- 2 spaces for selected filetypes
vim.cmd [[ autocmd FileType xml,html,xhtml,css,scss,javascript,lua,dart setlocal shiftwidth=2 tabstop=2]]

-- Remove whitespace on save
vim.cmd [[ au BufEnter * set fo-=c fo-=r fo-=o ]]
