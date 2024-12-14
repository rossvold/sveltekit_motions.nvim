-- init.lua
local movements = require("sveltekit-movements.movements")

local M = {}

function M.setup(opts)
	opts = opts or {}

	-- Default keymaps
	local page_keymap = opts.page_keymap or "<leader>find key" -- go to page
	local server_keymap = opts.server_keymap or "<leader>find key" -- go to server
	local alt_keymap = opts.alt_keymap or "<leader>find key" -- alternate between files
	local layout_keymap = opts.layout_keymap or "<leader>find key" -- go to layout
	local hooks_keymap = opts.hooks_keymap or "<leader>find key" -- go to hooks

	vim.keymap.set("n", page_keymap, movements.jump_to_client, {
		desc = "Jump to +page.svelte",
		silent = true,
	})

	vim.keymap.set("n", server_keymap, movements.jump_to_server, {
		desc = "Jump to +page.server.ts",
		silent = true,
	})

	vim.keymap.set("n", alt_keymap, movements.toggle_page_files, {
		desc = "Toggle between page and server files",
		silent = true,
	})

	vim.keymap.set("n", layout_keymap, movements.jump_to_layout, {
		desc = "Jump to nearest +layout.svelte",
		silent = true,
	})

	vim.keymap.set("n", hooks_keymap, movements.jump_to_hooks, {
		desc = "Jump to nearest +hooks.svelte",
		silent = true,
	})
end

return M
