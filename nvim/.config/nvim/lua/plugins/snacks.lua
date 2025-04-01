return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		dashboard = {
			enabled = false,
		},
		bigfile = { enabled = true },
		notifier = {
			enabled = true,
			style = "compact",
			timeout = 2500,
		},
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		win = {
			enabled = true,
		},
	},
}
