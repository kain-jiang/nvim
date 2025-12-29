vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
})

vim.cmd.colorscheme("randomhue")
require("mini.basics").setup()
require("mini.pairs").setup()
require("mini.cmdline").setup()
require("mini.files").setup()
require("mini.map").setup()

require("mini.icons").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()
require("mini.indentscope").setup()
require("mini.notify").setup()
require("mini.starter").setup()

require("mini.deps").setup()
local add = MiniDeps.add

add({
  source = "folke/lazydev.nvim",
})
require("lazydev").setup({})

add({
  source = "neovim/nvim-lspconfig",
  depends = { "williamboman/mason.nvim" },
})
require("mason").setup({})

add({
  source = "mason-org/mason-lspconfig.nvim",
  depends = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
})
require("mason-lspconfig").setup()

add({
  source = "saghen/blink.cmp",
  depends = { "rafamadriz/friendly-snippets" },
})
require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  fuzzy = { implementation = "lua" },
})

-- format
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- keys
local minifiles_toggle = function(...)
  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end
vim.keymap.set("n", "-", minifiles_toggle, {})
vim.keymap.set("n", "_", MiniMap.toggle, {})
