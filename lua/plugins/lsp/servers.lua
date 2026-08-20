-- Server configurations passed to vim.lsp.config().

return {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				completion = { callSnippet = "Replace" },
				format = {
					enable = true,
					defaultConfig = {
						indent_style = "space",
						indent_size = "2",
					},
				},
			},
		},
	},

	clangd = {
		cmd = { "clangd", "--enable-config" },
	},

	angularls = {
		root_markers = { "angular.json" },
		filetypes = { "typescript", "html" },
	},

	jsonls = function()
		return {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		}
	end,

	pyright = {
		root_markers = { "pyproject.toml", ".git" },
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticSeverityOverrides = {
						reportArgumentType = "none",
						reportAttributeAccessIssue = "none",
					},
				},
			},
		},
		on_init = function(client)
			local root = vim.fs.root(0, { "pyproject.toml", ".git" })
			if root then
				local py = root .. "/.venv/bin/python"
				if vim.fn.executable(py) == 1 then
					client.config.settings.python.pythonPath = py
				end
			end
		end,
	},
	qml_language_server = {
		cmd = { "qml-language-server" },
		filetypes = { "qml" },
		root_markers = { { "qmldir", "shell.qml" }, ".git" },
	},

	ts_ls = {},
	html = {},
	cssls = {},
	emmet_ls = {},
	gopls = {},
	rust_analyzer = {},
	omnisharp = {},
	bashls = {},
	yamlls = {},
	svelte = {},
}
