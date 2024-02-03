return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		auto_install = true,
		ensure_installed = {
			"bashls",
			"biome",
			"denols",
			"lua_ls",
			"marksman",
			-- "tsserver",
			"volar",
		},
	},
}
