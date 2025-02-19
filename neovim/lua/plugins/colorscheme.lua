return {
	{
		"sainnhe/gruvbox-material",
		lazy = true,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = false
			vim.g.gruvbox_material_disable_italic_comment = true
			vim.g.gruvbox_material_enable_bold = false
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},
			})
			vim.cmd.colorscheme("rose-pine-moon")
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine-moon",
		},
	},
}
