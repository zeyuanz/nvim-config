return {
	"stevearc/oil.nvim",
	-- enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true, -- start up nvim with oil instead of netrw
			columns = {},
			keymaps = {
				["<C-h>"] = false,
				["<C-c>"] = false, -- prevent from closing Oil as <C-c> is esc key
				["<M-h>"] = "actions.select_split",
				["q"] = "actions.close",
			},
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			skip_confirm_for_simple_edits = true,
			float = {
				-- Padding around the floating window
				padding = 2,
				-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
				max_width = 0,
				max_height = 0.75,
				border = nil,
				win_options = {
					winblend = 0,
				},
				-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
				get_win_title = nil,
				-- preview_split: Split direction: "auto", "left", "right", "above", "below".
				preview_split = "auto",
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				override = function(conf)
					return conf
				end,
			},
		})

		-- opens parent dir over current active window
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		-- open parent dir in float window
		vim.keymap.set("n", "<leader>e", require("oil").toggle_float)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil", -- Adjust if Oil uses a specific file type identifier
			callback = function()
				vim.opt_local.cursorline = true
			end,
		})
	end,
}
