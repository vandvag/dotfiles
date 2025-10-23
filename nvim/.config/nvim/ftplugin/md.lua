local opts = {
  -- Indenting behavior
  tabstop = 2, -- insert 2 spaces for a tab
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  wrap = true,
}


for k, v in pairs(opts) do
  vim.opt[k] = v
end
