local M = {}

function M.working_directory()
	return vim.fn.getcwd()
end

function M.absolute_path()
	return vim.fn.expand("%:p")
end

function M.current_file()
	return vim.fn.fnamemodify(M.absolute_path(), ":t")
end

function M.current_dir()
	return vim.fn.fnamemodify(M.absolute_path(), ":h")
end

function M.buf_filetype() -- Returns current buffer filetype
	return vim.bo.filetype
end

-- Read file before opening
function M.file_exists(path_parameter)
	local f = io.open(path_parameter, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

return M
