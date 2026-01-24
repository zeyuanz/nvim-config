-- ~/.config/nvim/lua/plugins/ibl.lua (LazyVim style) or in init.lua
return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = function()
        return {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = {
                    "help", "dashboard", "neo-tree", "Trouble", "lazy", "mason",
                    "gitcommit", "markdown", "text", "log", "json", "jsonc", "NvimTree"
                },
                buftypes = { "terminal", "nofile" },
            },
        }
    end,
}
