return {
	"akinsho/bufferline.nvim",
	version = "*",
    event = "BufReadPost",
	dependencies = "nvim-tree/nvim-web-devicons",
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	},

	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
				themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
				close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				auto_toggle_bufferline = true,
				enforce_regular_tabs = true,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
						separator = true,
					},
					{
						filetype = "snacks_layout_box",
					},
				},
			},
		})
	end,
}
