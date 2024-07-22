-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- python
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = ({"python"}),
})

-- ltex server for languagetool
lspconfig.ltex.setup({
  on_attach = function ()
		vim.env.JAVA_HOME = vim.fs.find(
			function(name) return vim.startswith(name, "jdk-") end,
			{ path = vim.fn.stdpath("data") .. "/mason/packages/ltex-ls/", type = "directory" }
		)[1]
	end,
  capabilities = capabilities,
  settings = {
    ltex = {
      language = "fr",
      additionalRules = {
        languageModel = "~/models/ngrams/",
      },
    },
  },
})
