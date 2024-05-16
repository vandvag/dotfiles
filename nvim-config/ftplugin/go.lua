local opts = {
	-- Indenting behavior
	tabstop = 8, -- insert 8 spaces for a tab
	shiftwidth = 8,   -- the number of spaces inserted for each indentation
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end
