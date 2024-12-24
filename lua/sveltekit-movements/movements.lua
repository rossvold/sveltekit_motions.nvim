local utils = require("sveltekit-movements.utils")

local M = {}

function M.jump_to_client()
	local current_dir = utils.current_dir()
	local path_client = current_dir .. "/+page.svelte"

	if utils.file_exists(path_client) then
		vim.cmd("edit " .. path_client)
	else
		vim.notify("No +page.svelte found in current directory", vim.log.levels.WARN)
	end
end

function M.jump_to_server()
	local current_dir = utils.current_dir()
	local path_server = current_dir .. "/+page.server.ts"

	if utils.file_exists(path_server) then
		vim.cmd("edit " .. path_server)
	else
		vim.notify("No +page.server.ts found in current directory", vim.log.levels.WARN)
	end
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
	local absolute_path = utils.absolute_path()

	while working_directory ~= current_dir do -- Test towards working directory
		local layout_path = current_dir .. "/+layout.svelte"
		local inside_layout = layout_path == absolute_path -- If the generated layoutpath is equal to the abs path, return true

		if utils.file_exists(layout_path) and not inside_layout then
			vim.cmd("edit " .. layout_path)
			vim.notify(layout_path)
			return
		end
		current_dir = vim.fn.fnamemodify(current_dir, ":h") -- Jump up one directory
	end
end

function M.jump_to_hooks()
local current_dir = utils.current_dir()
	local working_directory = utils.working_directory()

	while working_directory ~= current_dir do -- Test towards working directory
		local hooks_path = current_dir .. "/hooks.server.ts"

		if utils.file_exists(hooks_path) then
			vim.cmd("edit " .. hooks_path)
			vim.notify(hooks_path)
			return
		end
		current_dir = vim.fn.fnamemodify(current_dir, ":h") -- Jump up one directory
	end
end

return M
