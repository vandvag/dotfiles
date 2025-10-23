local opts = {
  -- Indenting behavior
  tabstop = 2, -- insert 8 spaces for a tab
  shiftwidth = 2,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
