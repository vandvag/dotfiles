local options = {
  -- General
  background = "dark",
  mouse = "a",
  timeoutlen = 300,    -- time to wait for a mapped sequence to complete (in ms)
  -- Files, Backup, Undo
  undofile = true,     -- enable persistent undo
  updatetime = 300,    -- faster completion (default = 4000ms)
  writebackup = false, -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  backup = false,      -- creates a backup file (everything is source controlled)
  swapfile = false,    -- no swap file
  lazyredraw = false,  -- good performance config, but conflics with noice.nvim, so I've turned it off

  -- UI Settings
  number = true,
  relativenumber = true,
  showmode = false,   -- Since we are using LuaLine
  laststatus = 2,     -- 2 -> Always show statusline
  cursorline = false, -- Hightlight the cursor line
  cmdheight = 2,      -- more space in the neovim command line for displaying messages
  showtabline = 0,    -- 2 -> always show tabs, 1-> if at least 2 tabs, 0 -> never
  splitbelow = true,  -- force all horizontal splits to appear to the bottom
  splitright = true,  -- force all vertical splits to appear to the right
  wrap = false,       -- display lines in one long line
  scrolloff = 8,
  sidescrolloff = 8,
  pumheight = 10,
  termguicolors = true,
  list = true,
  listchars = {
    tab = '>  ',
    space = '·'
  },
  winborder = 'rounded',

  -- Indenting behavior
  expandtab = true, -- true -> convert tabs to spaces
  tabstop = 4,      -- insert <n> spaces for a tab
  shiftwidth = 4,   -- the number of spaces inserted for each indentation
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

-- ripgrep
vim.opt.grepprg = "rg -i -uu ."

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- 2 spaces for selected filetypes
vim.cmd [[ autocmd FileType html,xhtml,css,scss,lua,dart setlocal shiftwidth=2 tabstop=2]]

-- Remove whitespace on save
vim.cmd [[ au BufEnter * set fo-=c fo-=r fo-=o ]]

