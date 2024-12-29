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
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox-material",
		},
	},
}
