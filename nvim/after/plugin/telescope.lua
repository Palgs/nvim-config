local telescope = require('telescope')
local builtin = require('telescope.builtin')
local fb_actions = telescope.extensions.file_browser.actions
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Henlo > ") })
end)

telescope.setup {
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    ["<C-c>"] = fb_actions.create_from_prompt,
                    ["<C-r>"] = fb_actions.rename
                },
                ["n"] = {
                    ["-"] = fb_actions.goto_parent_dir,
                    ["<C-c>"] = fb_actions.create,
                    ["D"] = fb_actions.remove,
                    ["<C-r>"] = fb_actions.rename
                }
            },
        },
    },
}
telescope.load_extension "file_browser"
