local X = {}

function X.noremap(mode, lhs, rhs, description, additional_options)
	local options = { noremap = false, silent = true, desc = description }
	if additional_options then
		options = vim.tbl_deep_extend("force", options, additional_options)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

function X.remap(mode, lhs, rhs, description, additional_options)
	local options = { noremap = true, silent = true, desc = description }
	if additional_options then
		options = vim.tbl_deep_extend("force", options, additional_options)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end
return X
