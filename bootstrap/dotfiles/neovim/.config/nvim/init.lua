require("config.set")
require("config.remap")
require("config.lsp")
require("config.diagnostic")
require("commands.auto")
require("commands.user")

-- Load Lazy *after* configuration.
require("config.lazy")
