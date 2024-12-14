-- Helper functions
-- TODO: make a helper function to identify what framework you are.
-- Prob have to analyze the contents of package.json and check if react/next/svelte/sveltekit is present.
--
-- Probably will have some issues if you have a repo with both kek

local M = {}

function M.get_current_file()
	return vim.fn.expand("%:p")
end

function M.file_exists(file)
	local f = io.open(file, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

function M.get_current_dir()
	return vim.fn.fnamemodify(M.get_current_file(), ":h")
end

return M
