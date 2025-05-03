return {
	cmd = { "golangci-lint-langserver" },
	filetypes = { "go", "gomod" },
	root_markers = {
		"go.mod",
		".golangci-lint.yaml",
		".golangci-lint.yml",
		".golangci-lint.toml",
		".golangci-lint.json",
	},
	init_options = {
		command = {
			"golangci-lint",
			"run",
			"--output.json.path",
			"stdout",
			"--show-stats=false",
		},
	},
}
