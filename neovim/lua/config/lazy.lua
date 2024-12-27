local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "plugins" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },
		{ import = "lazyvim.plugins.extras.lang.clangd" },
		{ import = "lazyvim.plugins.extras.lang.cmake" },
		{ import = "lazyvim.plugins.extras.lang.docker" },
		{ import = "lazyvim.plugins.extras.lang.elixir" },
		{ import = "lazyvim.plugins.extras.lang.git" },
		{ import = "lazyvim.plugins.extras.lang.go" },
		{ import = "lazyvim.plugins.extras.lang.helm" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.nix" },
		{ import = "lazyvim.plugins.extras.lang.ruby" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.sql" },
		{ import = "lazyvim.plugins.extras.lang.tex" },
		{ import = "lazyvim.plugins.extras.lang.toml" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.yaml" },
		{ import = "lazyvim.plugins.extras.lang.zig" },
		{
			"folke/tokyonight.nvim",
			lazy = true,
			opts = {
				style = "moon",
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
				},
				transparent = false,
			},
		},
		{
			"nvim-treesitter/nvim-treesitter",
			opts = {
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = { "graphql" },
			},
		},
		{
			"nvim-neo-tree/neo-tree.nvim",
			opts = {
				filesystem = {
					filtered_items = {
						visible = true,
						show_hidden_count = true,
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = {},
						never_show = {},
					},
				},
			},
			keys = {
				{
					"<leader>e",
					function()
						require("neo-tree.command").execute({ action = "focus" })
					end,
					desc = "Explorer NeoTree",
				},
			},
		},
		{
			"nvim-lualine/lualine.nvim",
			event = "VeryLazy",
			opts = function()
				return {
					options = {
						component_separators = "",
						section_separators = "",
					},
				}
			end,
		},
		{
			"neovim/nvim-lspconfig",
			opts = {
				inlay_hints = { enabled = false },
				codelens = { enabled = false },
				servers = {
					lua_ls = {
						settings = {
							Lua = {
								diagnostics = {
									globals = {},
								},
							},
						},
					},
					gopls = {
						settings = {
							gopls = {
								analyses = {
									fieldalignment = false,
								},
							},
						},
					},
				},
			},
		},
	},
	defaults = {
		lazy = false,
		version = false,
	},
	install = { colorscheme = { "tokyonight", "habamax" } },
	checker = {
		enabled = true,
		notify = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
