return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "ruff" },
		}

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })

		vim.api.nvim_create_autocmd("InsertLeave", {
			callback = function()
				lint.try_lint()
			end,
			desc = "Trigger linting when leaving insert mode",
		})
	end,
}
