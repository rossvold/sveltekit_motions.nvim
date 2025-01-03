function M.jump_to_layout()
	local current_dir = utils.current_dir()
	local working_directory = utils.working_directory()
	local layout_pattern = patterns.layout_pattern()
	local index_start = 1

	local current_file = utils.current_file() -- NOTE: this has to be used to offset the index
	for index = 1, #layout_pattern do
		if current_file == layout_pattern[index] then
			index_start = index
		end
	end

	while working_directory ~= current_dir do -- Test towards working directory
		for index = index_start, #layout_pattern do
			local layout_path = current_dir .. "/" .. layout_pattern[index]
			local same_path = utils.absolute_path() == layout_path
			if utils.file_exists(layout_path) and not same_path then
				vim.cmd("edit " .. layout_path)
				vim.notify(layout_path)
				return
			end
		end
		index_start = 1 -- After first loop, remove index offset.
		current_dir = vim.fn.fnamemodify(current_dir, ":h") -- Jump up one directory
	end

end

function M.jump_to_hooks()
	local current_dir = utils.current_dir()
	local working_directory = utils.working_directory()
	local layout_pattern = patterns.layout_pattern()
	local index_start = 1

	local current_file = utils.current_file() -- NOTE: this has to be used to offset the index
	for index = 1, #layout_pattern do
		if current_file == layout_pattern[index] then
			index_start = index
		end
	end

	while working_directory ~= current_dir do -- Test towards working directory
		for index = index_start, #layout_pattern do
			local layout_path = current_dir .. "/" .. layout_pattern[index]
			local same_path = utils.absolute_path() == layout_path
			if utils.file_exists(layout_path) and not same_path then
				vim.cmd("edit " .. layout_path)
				vim.notify(layout_path)
				return
			end
		end
		index_start = 1 -- After first loop, remove index offset.
		current_dir = vim.fn.fnamemodify(current_dir, ":h") -- Jump up one directory
	end
end
