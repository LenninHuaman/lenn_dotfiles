-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

lspconfig.basedpyright.setup({
	capabilities = nvlsp.capabilities,
	settings = {
		disableOrganizeImports = true,
		basedpyright = {
			analysis = {
				ignore = { "*" },
				typeCheckingMode = "standard",
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

require("lspconfig").ruff.setup({
	init_options = {
		settings = {
			lint = {
				enable = false,
				preview = true,
			},
		},
	},
})

lspconfig.jdtls.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	filetypes = { "java" },
})

-- lspconfig.ruff_lsp.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.hoverProvider = false
--   end,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
-- lspconfig.pyright.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   settings = {
--     pyright = {
--       disableOrganizeImports = true,
--       disableTaggedHints = true,
--     },
--     python = {
--       analysis = {
--         diagnosticSeverityOverrides = {
--           reportUndefinedVariable = "none",
--         },
--       },
--     },
--   },
-- }

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
