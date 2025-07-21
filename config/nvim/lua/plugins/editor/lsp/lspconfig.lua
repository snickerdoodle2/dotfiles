return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- TODO: TELESCOPE??
				map("gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
				map("K", function()
					vim.lsp.buf.hover({ border = "single" })
				end, "Hover")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclarations")
				map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
				map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinitions")
				-- map('<leader>ds', document_symbols, '[D]ocument [Symbols]')
				-- map('<leader>ws', workspace_symbols, '[W]orkspace [Symbols]')
				map("<C-s>", function()
					vim.lsp.buf.signature_help({ border = "single" })
				end, "[S]ignature Help")
				map("<F2>", vim.lsp.buf.rename, "Rename")
				map("<F4>", vim.lsp.buf.code_action, "Code Actions")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if not client then
					return
				end

				if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
					vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
				end
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "single", source = "if_many" },
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
		})

		local servers = {
			lua_ls = {
				-- cmd = { ... },
				-- filetypes = { ... },
				-- capabilities = {},
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},
			tailwindcss = {
				settings = {
					tailwindCSS = {
						includeLanguages = {
							elixir = "html-eex",
							eelixir = "html-eex",
							heex = "html-eex",
						},
					},
				},
			},
			emmet_language_server = {
				filetypes = { "heex" },
			},
		}

		for server, opts in pairs(servers) do
			vim.lsp.config(server, opts)
		end

		local ensure_installed = vim.tbl_keys(servers or {})

		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("zls")
		vim.lsp.enable("nushell")
		vim.lsp.enable("nil_ls")

		-- Installed locally

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
			automatic_enable = true,
			automatic_installation = false,
		})
	end,
}
