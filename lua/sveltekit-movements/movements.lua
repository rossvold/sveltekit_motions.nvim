local utils = require("sveltekit-movements.utils")
local patterns = require("sveltekit-movements.patterns")

local M = {}

function M.jump_to_client()
	local current_dir = utils.current_dir()
	local pattern = patterns.page_pattern()
	local index_start = 1

	for index = index_start, #pattern do
		local path_client = current_dir .. pattern[index]
		if utils.file_exists(path_client) then
			vim.notify("Edit current buffer activated")
			vim.cmd("edit " .. path_client)
		else
			vim.notify("No +page.svelte found in current directory", vim.log.levels.WARN)
		end
	end
end

function M.jump_to_server()
	local current_dir = utils.current_dir()
	local server_pattern = patterns.server_pattern()

	local index_start = 1
	local current_file = utils.current_file() -- NOTE: this has to be used to offset the index
	for index = 1, #server_pattern do
		if current_file == server_pattern[index] then
			index_start = index
			print(index_start)
		end
	end

	local abs_path = utils.absolute_path()
	for index = index_start, #server_pattern do
		local server_path = current_dir .. "/" .. server_pattern[index]
		local same_path = abs_path == server_path
		if utils.file_exists(server_path) and not same_path then
			vim.cmd("edit " .. server_path)
			vim.notify(server_path)
			return
		end
	end
	vim.notify("1. Could not find a match")
end

function M.toggle_page_files()
	local current_file = utils.current_file()
	local current_dir = utils.current_dir()

	if current_file:match("+page%.svelte$") then
		local server_path = current_dir .. "/+page.server.ts"
		if utils.file_exists(server_path) then
			vim.cmd("edit " .. server_path)
		else
			vim.notify("No corresponding server file found", vim.log.levels.WARN)
		end
	elseif current_file:match("+page%.server%.ts$") then
		local page_path = current_dir .. "/+page.svelte"
		if utils.file_exists(page_path) then
			vim.cmd("edit " .. page_path)
		else
			vim.notify("No corresponding page file found", vim.log.levels.WARN)
		end
	else
		vim.notify("Not in a page or server file", vim.log.levels.WARN)
	end
end

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

	local abs_path = utils.absolute_path()
	while working_directory ~= current_dir do -- Test towards working directory
		for index = index_start, #layout_pattern do
			local layout_path = current_dir .. "/" .. layout_pattern[index]
			local same_path = abs_path == layout_path
			if utils.file_exists(layout_path) and not same_path then
				vim.cmd("edit " .. layout_path)
				vim.notify(layout_path)
				return
			end
		end
		-- After first loop, remove index offset.
		index_start = 1
		current_dir = vim.fn.fnamemodify(current_dir, ":h") -- Jump up one directory
	end
	vim.notify("2. Could not find a match")
end

function M.jump_to_hooks()
	local current_dir = utils.current_dir()
	local working_directory = utils.working_directory()
	local hook_pattern = patterns.hook_pattern()
	local index_start = 1

	local current_file = utils.current_file() -- NOTE: this has to be used to offset the index
	for index = 1, #hook_pattern do
		if current_file == hook_pattern[index] then
			index_start = index
		end
	end

	local abs_path = utils.absolute_path()
	while working_directory ~= current_dir do -- Test towards working directory
		for index = index_start, #hook_pattern do
			local hook_path = current_dir .. "/" .. hook_pattern[index]
			local same_path = abs_path == hook_path
			if utils.file_exists(hook_path) and not same_path then
				vim.cmd("edit " .. hook_path)
				vim.notify(hook_path)
				return
			end
		end
		-- After first loop, remove index offset.
		index_start = 1
		current_dir = vim.fn.fnamemodify(current_dir, ":h") -- Jump up one directory
	end
	vim.notify("3. Could not find a match")
end

function M.jump_to_error()
local current_dir = utils.current_dir()
	local working_directory = utils.working_directory()
	local error_pattern = patterns.error_pattern()
	local index_start = 1

	local current_file = utils.current_file() -- NOTE: this has to be used to offset the index
	for index = 1, #error_pattern do
		if current_file == error_pattern[index] then
			index_start = index
		end
	end

	local abs_path = utils.absolute_path()
	while working_directory ~= current_dir do -- Test towards working directory
		for index = index_start, #error_pattern do
			local error_path = current_dir .. "/" .. error_pattern[index]
			local same_path = abs_path == error_path
			if utils.file_exists(error_path) and not same_path then
				vim.cmd("edit " .. error_path)
				vim.notify(error_path)
				return
			end
		end
		-- After first loop, remove index offset.
		index_start = 1
		current_dir = vim.fn.fnamemodify(current_dir, ":h") -- Jump up one directory
	end
	vim.notify("4. Could not find a match")
end

return M
