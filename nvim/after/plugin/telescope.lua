local telescope = require('telescope')
local builtin = require('telescope.builtin')
local fb_actions = telescope.extensions.file_browser.actions

local shit = function ()
    require('telescope').extensions.file_browser.file_browser {
        cwd = '%:p:h',
        hidden = true,
        layout_config = {
            height = 0.6,
            width = 160
        },
        on_complete = {
            function ()
                vim.cmd'stopinsert'
            end
        }
    }
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set("n", "<leader>pv", function ()
    shit()
end) --open vim Explorer
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Henlo > ") })
end)

telescope.setup {
    extensions = {
        file_browser = {
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
