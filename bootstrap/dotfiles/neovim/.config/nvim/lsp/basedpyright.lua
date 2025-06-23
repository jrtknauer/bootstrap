return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
        ".git",
		"pyproject.toml",
		"setup.py",
	},
	capabilities = {
		textDocument = {
			publishDiagnostics = {
				tagSupport = { 2 },
			},
		},
	},
	settings = {
		basedpyright = {
			disableOrganizeImports = true,
			analysis = {
				typeCheckingMode = "strict",
			},
		},
	},
}
