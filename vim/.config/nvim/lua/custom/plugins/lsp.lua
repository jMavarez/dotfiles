return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/neodev.nvim", opts = {} },
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"stevearc/conform.nvim",
			{ "numToStr/Comment.nvim", opts = {} },
		},
		config = function()
			require("neodev").setup()

			local capabilities = nil
			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local lspconfig = require("lspconfig")
			local servers = {
				bashls = true,
				clangd = true,
				gopls = true,
				lua_ls = true,
				-- gdtoolkit = true,
				tsserver = true,
				lexical = {
					cmd = {
						"/Users/josuemavarez/.local/share/nvim/mason/bin/lexical",
						"server",
					},
					root_dir = function(fname)
						return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
					end,
				},
				kotlin_language_server = {
					kotlin = {
						java = {
							home = os.getenv("JAVA_HOME"),
						},
					},
					command = "/Users/josuemavarez/.local/shared/nvim/mason/bin/kotlin_language_server",
					-- → kotlin.compiler.jvm.target                     default: "default"
					-- → kotlin.completion.snippets.enabled             default: true
					-- → kotlin.debounceTime                            default: 250
					-- → kotlin.debugAdapter.enabled                    default: true
					-- → kotlin.debugAdapter.path                       default: ""
					-- → kotlin.diagnostics.debounceTime                default: 250
					-- → kotlin.diagnostics.enabled                     default: true
					-- → kotlin.diagnostics.level                       default: "hint"
					-- → kotlin.externalSources.autoConvertToKotlin     default: false
					-- → kotlin.externalSources.useKlsScheme            default: true
					-- → kotlin.indexing.enabled                        default: true
					-- → kotlin.inlayHints.chainedHints                 default: false
					-- → kotlin.inlayHints.parameterHints               default: false
					-- → kotlin.inlayHints.typeHints                    default: false
					-- → kotlin.java.home                               default: ""
					-- → kotlin.java.opts                               default: ""
					-- → kotlin.languageServer.debugAttach.autoSuspend  default: false
					-- → kotlin.languageServer.debugAttach.enabled      default: false
					-- → kotlin.languageServer.debugAttach.port         default: 5005
					-- → kotlin.languageServer.enabled                  default: true
					-- → kotlin.languageServer.path                     default: ""
					-- → kotlin.languageServer.port                     default: 0
					-- → kotlin.languageServer.transport                default: "stdio"
					-- → kotlin.linting.debounceTime                    default: 250
					-- → kotlin.scripts.buildScriptsEnabled             default: false
					-- → kotlin.scripts.enabled                         default: false
					-- → kotlin.snippetsEnabled                         default: true
					-- → kotlin.trace.server                            default: "off"
					capabilities = {
						documentOnTypeFormattingProvider = false,
						documentLinkProvider = false,
						colorProvider = false,
					},
					-- filetypes = { "kotlin" },
				},
				htmx = true,
			}

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))

			require("mason").setup()

			local ensure_installed = {
				"stylua",
				"lua_ls",
				"ktlint",
				"htmlbeautifier",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end

				config = vim.tbl_deep_extend("force", {}, { capabilities = capabilities }, config)
				lspconfig[name].setup(config)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementations")
					map("<leader>re", function()
						vim.lsp.buf.rename()
					end, "[Re]name")
					map("<leader>df", function()
						vim.lsp.buf.format()
					end, "[D]o [F]ormat")
					map("K", function()
						vim.lsp.buf.hover()
					end, "Hover documentation")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				end,
			})
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					kotlin = { "ktlint" },
				},
			})

			-- TODO: Auto save using neovim's buf.format
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	callback = function(args)
			-- 		require("conform").format({
			-- 			bufnr = args.buf,
			-- 			lsp_fallback = true,
			-- 			quiet = true,
			-- 		})
			-- 	end,
			-- })
		end,
	},
}
