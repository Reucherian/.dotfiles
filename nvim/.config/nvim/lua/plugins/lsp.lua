return {
	{
		-- sets sensible configurations for lsp
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			-- lsp configuration
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP " .. desc })
					end
					local telescope = require("telescope.builtin")
					-- renames the variable usually works across buffers
					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
					map("grr", telescope.lsp_references, "[G]oto [R]eferences")
					map("gri", telescope.lsp_implementations, "[G]oto [I]mplementation")
					map("grd", telescope.lsp_definitions, "[G]oto [D]efinition")
					map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gO", telescope.lsp_document_symbols, "Open Document Symbols")
					map("gW", telescope.lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
					map("grt", telescope.lsp_type_definitions, "[G]oto [T]ype Definition")
					-- the following autocommands will enable showing references for items under the cursor
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client:supports_method("textDocument/documentHighlight", event.buf) then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
							end,
						})
					end
					-- enable toggle for inlay hints (toggle since it displaces code)
					if client and client:supports_method("textDocument/inlayHint", event.buf) then
						map("leader<th>", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay Hints")
					end
				end,
			})

			-- diagnostics configuration
			vim.diagnostic.config({
				severity_sort = true,
				underline = { severity = vim.diagnostic.severity.ERROR },
				update_in_insert = false,
				virtual_text = {
					source = "if_many",
					spacing = 4,
					prefix = "●",
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})

			-- specific additional server settings go here
			-- defaults come from nvim-lspconfig
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
				cssls = {
					settings = {
						css = { lint = { unknownAtRules = "ignore" } },
					},
				},
			}
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(
				ensure_installed,
				{ "stylua", "html", "cssls", "emmet_ls", "ts_ls", "pyright", "gopls", "ansiblels", "tailwindcss" }
			)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup({
				ensure_installed = {}, -- explicitly set so as to use only mason-tool-installer
				automatic_installation = false,
			})
		end,
	},
}
