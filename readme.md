# Frontend Movements

A Neovim plugin for more efficient navigation in framework projects.

This plugin provides specific movements for frontend navigation patterns.

## Currently supported
- [x] Sveltekit
- [ ] Next.Next.js

## TODO:
Add support for frameworks with simular type of navigation, like next.js approuter.
- [] Add navigation to error file
- [] Add toggle for hooks files
- [] Add toggle for layout files
- [] Next.js app router

## Motivation

While working with frameworks like SvelteKit, I found myself constantly jumping between related files:
- Switching between `+page.svelte` and its corresponding `+page.server.ts`
- Jumping to the closest +layout.svelte upwards in the filetree.

Telescope & harpoon doesn't really solve this because this is depenent on the file you currently are in.

## Features

- Toggle between client & server
- Jump to the nearest parent `+layout.svelte` file & upwards

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
    "rossvold/frontend-movements.nvim",
    config = function()
            require("sveltekit-movements").setup()
    end
}
```

## Usage

Default keymaps:
- `<leader>sc` - Jump to nearest parent `+layout.svelte`
- `<leader>ss` - Jump to `+page.server.ts/js`
- `<leader>sl` - Jump to nearest parent `+layout.svelte`
- `<leader>sh` - Jump to nearest parent `+hooks.server.ts`
- `<leader>sa` - Toggle between `+page.svelte` and `+page.server.ts`

## Configuration

The plugin can be configured through the setup function. The default configuration is:

```lua
require("sveltekit-movements").setup({
    -- default keybinds
    -- Jump to spesific file
    page_keymap = '<Leader>sc',  -- Jump to +page.svelte
    server_keymap = '<Leader>ss', -- Jump to +page.server.ts
    layout_keymap = '<leader>sl', -- Jump to nearest layout file
    hooks_keymap = '<leader>sh', -- Jump to nearest hooks file
    -- Toggles
    toggle_keymap = '<Leader>sa',  -- Alternate between page/server
})
```

You can customize these keybindings to your preference by modifying the keymap values.

## License

MIT, do whatever bro
