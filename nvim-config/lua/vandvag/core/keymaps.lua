local noremap = require("vandvag.core.utils").noremap

-- Space is the best leader key
noremap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- MODES
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- Normal Mode
-- Better split window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Open window explorer

-- That's for netrw
-- keymap("n", "<leader>o", ":Lex 30<cr>", opts)
noremap("n", "<leader>o", ":lua MiniFiles.open() MiniFiles.open()<cr>", "Open MiniFiles file explorer")

-- Resize with arrows (Well doesn't work well with macos)
noremap("n", "<C-Up>", ":resize +2<cr>", "Resize up")
noremap("n", "<C-Down>", ":resize -2<cr>", "Resize down")
noremap("n", "<C-Left>", ":vertical resize -2<cr>", "Resize left")
noremap("n", "<C-Right>", ":vertical resize +2<cr>", "Resize right")

-- Buffers
noremap("n", "<S-l>", ":bnext<cr>", "Go to next buffer")
noremap("n", "<S-h>", ":bprevious<cr>", "Go to previous buffer")
noremap("n", "<leader>bd", ":bdelete<cr>", "Delete current buffer")
vim.api.nvim_create_user_command(
	"BufOnly",
	function()
		vim.cmd("%bdelete|edit #|bdelete#")
	end,
	{}
)
noremap("n", "<leader>bk", ":BufOnly<cr>", "Delete all but current buffer")

noremap("n", "<C-j>", ":cNext<cr>", "Go to next item in qfixlist")
noremap("n", "<C-k>", ":cPrev<cr>", "Go to previous item in qfixlist")
--
-- Visual
--

-- Stay in indent mode
noremap("v", "<", "<gv")
noremap("v", ">", ">gv")

-- Move text up and down
noremap("v", "<A-j>", ":m .+1<cr>==")
noremap("v", "<A-k>", ":m .-2<cr>==")
noremap("v", "p", '"_dP')

--
-- Visual Block
--

-- Move text up and down
noremap("x", "J", ":move '>+1<cr>gv-gv")
noremap("x", "K", ":move '<-2<cr>gv-gv")
noremap("x", "<A-j>", ":move '>+1<cr>gv-gv")
noremap("x", "<A-k>", ":move '<-2<cr>gv-gv")

-- Autoformat
noremap("n", "<leader>l", "<cmd>lua vim.lsp.buf.format()<cr>", "Format document")

