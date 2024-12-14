# Frontend Movements

A Neovim plugin for more efficient navigation in framework projects.

This plugin provides specific movements for frontend navigation patterns.

## Currently supported
[x] - Sveltekit
[] - Next.Next.js

## TODO:
Add support for frameworks with simular file structures
[] - Next.js app router

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
{
    "TheIbraDev/frontend-movements.nvim",
    config = function()
        require("frontend-movements").setup()
    end
}
```

## Usage

Default keymaps:
- `<leader>st` - Toggle between `+page.svelte` and `+page.server.ts`
- `<leader>sl` - Jump to nearest parent `+layout.svelte`

## Configuration

The plugin can be configured through the setup function. The default configuration is:

```lua
{
    "yourusername/frontend w-movements.nvim",
    config = function()
        require("frontend w-movements").setup({
            -- Toggle between +page.svelte and +page.server.ts
            toggle_keymap = '<leader>st',

            -- Jump to nearest parent +layout.svelte
            layout_keymap = '<leader>sl',
        })
    end
}
```

You can customize these keybindings to your preference by modifying the keymap values.

## License

MIT, do whatever bro
