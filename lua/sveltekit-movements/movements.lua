local utils = require("sveltekit-movements.utils")

local M = {}

function M.jump_to_client()
	local current_dir = utils.get_current_dir()
	local page_file = current_dir .. "/+page.svelte"

	if utils.file_exists(page_file) then
		vim.cmd("edit " .. page_file)
	else
		vim.notify("No +page.svelte found in current directory", vim.log.levels.WARN)
	end
end

function M.jump_to_server()
	local current_dir = utils.get_current_dir()
	local server_file = current_dir .. "/+page.server.ts"

	if utils.file_exists(server_file) then
		vim.cmd("edit " .. server_file)
	else
		vim.notify("No +page.server.ts found in current directory", vim.log.levels.WARN)
	end
end

function M.toggle_page_files()
	local current_file = utils.get_current_file()

	if current_file:match("+page%.svelte$") then
		local server_file = current_file:gsub("+page%.svelte$", "+page.server.ts")
		if utils.file_exists(server_file) then
			vim.cmd("edit " .. server_file)
		else
			vim.notify("No corresponding server file found", vim.log.levels.WARN)
		end
	elseif current_file:match("+page%.server%.ts$") then
		local page_file = current_file:gsub("+page%.server%.ts$", "+page.svelte")
		if utils.file_exists(page_file) then
			vim.cmd("edit " .. page_file)
		else
			vim.notify("No corresponding page file found", vim.log.levels.WARN)
		end
	else
		vim.notify("Not in a page or server file", vim.log.levels.WARN)
	end
end

function M.jump_to_layout()
	local current_file = utils.get_current_file()
	local current_dir = vim.fn.fnamemodify(current_file, ":h")

	local in_layout = current_file:match("+layout%.svelte$")

	while current_dir ~= "/" do
		local layout_file = current_dir .. "/+layout.svelte"

		if utils.file_exists(layout_file) and (not in_layout or layout_file ~= current_file) then
			vim.cmd("edit " .. layout_file)
			return
		end
		current_dir = vim.fn.fnamemodify(current_dir, ":h")
	end

	vim.notify("No layout file found in parent directories", vim.log.levels.WARN)
end

function M.jump_to_hooks()
	local current_file = utils.get_current_file()
	local current_dir = vim.fn.fnamemodify(current_file, ":h")

	local in_hooks = current_file:match("+hooks%.svelte$")

	while current_dir ~= "/" do
		local hooks_file = current_dir .. "/hooks.server.ts"

		if utils.file_exists(hooks_file) and (not in_hooks or hooks_file ~= current_file) then
			vim.cmd("edit " .. hooks_file)
			return
		end
		current_dir = vim.fn.fnamemodify(current_dir, ":h")
	end

	vim.notify("No hooks file found in parent directories", vim.log.levels.WARN)
end

return M
