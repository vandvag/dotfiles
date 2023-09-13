local opts = { noremap = true, silent = true}

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap -- Cause we like it shorter

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
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Open window explorer
keymap("n", "<leader>b", ":Lex 30<cr>", opts)

-- Resize with arrows (Well doesn't work well with macos)
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- keymap("n", "<leader>l" ,":Format<cr>", opts)
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

-- NvimTree
keymap("n", "<leader>b", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false}))<cr>", opts)
keymap("n", "<leader>t", "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols(require('telescope.themes').get_dropdown({ previewer = false}))<cr>", opts)
keymap("n", "<leader>r", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
keymap("n", "<leader>l", "<cmd>lua vim.lsp.buf.format() <cr>", opts)

-- Debugging
keymap("n", "<F5>", "<cmd> lua require'dap'.continue()<cr>", opts)
keymap("n", "<F10>", "<cmd> lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F11>", "<cmd> lua require'dap'.step_into()<cr>", opts)
keymap("n", "<S-F11>", "<cmd> lua require'dap'.step_out()<cr>", opts)
keymap("n", "<F9>", "<cmd> lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>bb", "<cmd> lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>db", "<cmd> lua require'dap'.repl_open()<cr>", opts)



