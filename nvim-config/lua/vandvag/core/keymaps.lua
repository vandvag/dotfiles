local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set -- Cause we like it shorter

-- Space is the best leader key
keymap("", "<Space>", "<Nop>", opts)
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
keymap("n", "<leader>o", ":lua MiniFiles.open() MiniFiles.open()<cr>", opts)

-- Resize with arrows (Well doesn't work well with macos)
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Buffers
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)
keymap("n", "<leader>bd", ":bdelete<cr>", opts)
vim.api.nvim_create_user_command(
	"BufOnly",
	function()
		vim.cmd("%bdelete|edit #|bdelete#")
	end,
	{}
)
keymap("n", "<leader>bk", ":BufOnly<cr>", opts)

keymap("n", "<C-j>", ":cNext<cr>", opts)
keymap("n", "<C-k>", ":cPrev<cr>", opts)
--
-- Visual
--

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<cr>==", opts)
keymap("v", "<A-k>", ":m .-2<cr>==", opts)
keymap("v", "p", '"_dP', opts)

--
-- Visual Block
--

-- Move text up and down
keymap("x", "J", ":move '>+1<cr>gv-gv", opts)
keymap("x", "K", ":move '<-2<cr>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<cr>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<cr>gv-gv", opts)

-- Autoformat
keymap("n", "<leader>l", "<cmd>lua vim.lsp.buf.format() <cr>", opts)

