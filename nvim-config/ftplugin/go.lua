local opts = {
  -- Indenting behavior
  tabstop = 4, -- insert <n> spaces for a tab
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
