return {
	"saghen/blink.cmp",
	event = "VeryLazy", -- required to set capabilities by default
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = { documentation = { auto_show = false, auto_show_delay_ms = 500 } },
		-- TODO: lazydev completions
		sources = { default = { "lsp", "path", "snippets" } },
		fuzzy = { implementation = "prefer_rust_with_warning" },
		signature = { enabled = true },
	},
}
