return {
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
						staticcheck = false,
					},
				},
			},
		},
	},
}
