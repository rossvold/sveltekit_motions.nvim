local M = {}

function M.layout_pattern()
	local layout_template = {
		'+layout.svelte',
		'+layout.server.ts',
		'+layout.ts',
	}
	return layout_template
end

function M.hook_pattern()
	local hook_template = {
		'hooks.ts',
		'hooks.server.ts',
	}
	return hook_template
end

function M.page_pattern()
	local page_template = {
		'/+page.svelte',
	}
	return page_template
end

function M.error_pattern()
	local error_template = {
		'+error.svelte',
		'+error.ts',
	}
	return error_template
end

function M.server_pattern()
	local server_template = {
		'+page.server.ts',
		'+server.ts',
		'+page.ts',
	}
	return server_template
end

return M
