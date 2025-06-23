return {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "tf", "terraform", "terraform-vars" },
	root_markers = {
        ".git",
		".terraform",
	},
}
