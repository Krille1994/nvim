return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		-- C-y to accept, C-n/C-p to cycle, C-e to dismiss, C-space to show
		keymap = { preset = "default" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			list = {
				selection = { preselect = true, auto_insert = false },
			},
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
					},
				},
			},
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},

		signature = { enabled = true },

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
