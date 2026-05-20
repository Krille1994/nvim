require("core.options")
require("core.remap")
require("core.autocmds")
require("core.diagnostics")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.colorscheme"),
	require("plugins.bufferline"),
	require("plugins.formatting"),
	require("plugins.indent-blankline"),
	require("plugins.linting"),
	require("plugins.lualine"),
	require("plugins.neotree"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.trouble"),
	require("plugins.which-key"),
	require("plugins.markdown-preview"),
	require("plugins.misc"),
	require("plugins.lsp"),
	require("plugins.blink-cmp"),
	require("plugins.notify"),
	require("plugins.gitsigns"),
})

require("custom.terminal")
require("custom.quick-ng")

-- Built-in opt-in plugins (0.12)
pcall(vim.cmd, "packadd nvim.undotree")

require("core.theme").setup()

-- vim: ts=2 sts=2 sw=2 et
