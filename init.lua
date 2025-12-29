vim.pack.add({
  -- "https://github.com/Mofiqul/dracula.nvim",
  "https://github.com/catppuccin/nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/owallb/mason-auto-install.nvim",
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim", -- diagnostic
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvimdev/dashboard-nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/folke/noice.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/rcarriga/nvim-notify",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/folke/lazydev.nvim",
})

-- ui
vim.cmd("colorscheme catppuccin")
vim.opt.number = true
vim.opt.showtabline = 2

require("tiny-inline-diagnostic").setup({})
require("neo-tree").setup({})
require("lualine").setup({})
require("bufferline").setup({})
require("ibl").setup()
require("which-key").setup({})
require("telescope").setup({})
require("noice").setup({})
require("lazydev").setup({})
require("mason").setup({})
require("mason-lspconfig").setup({ automatic_enable = false })
require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  fuzzy = { implementation = "lua" },
})
require("mason-auto-install").setup({
  packages = { "lua-language-server", "stylua", "gopls" },
})

vim.lsp.enable({ "lua_ls", "stylua", "gopls" })

-- events
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("dashboard").setup({})
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- key
-- vim.keymap.set("n", ":", ":FineCmdline<Cr>", { silent = true })
vim.keymap.set("n", "-", ":Neotree focus<Cr>", { silent = true, desc = "neotree" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { silent = true, desc = "format" })
vim.keymap.set("n", "<leader>e", ":Neotree focus<Cr>", { silent = true, desc = "neotree" })
vim.keymap.set("n", "<leader>qq", ":qa!<Cr>", { silent = true, desc = "exit force" })
vim.keymap.set("n", "<leader>bd", ":bd<Cr>", { silent = true, desc = "close buf" })
vim.keymap.set("n", "<leader>bD", ":bd!<Cr>", { silent = true, desc = "close buf force" })
vim.keymap.set({ "i", "n" }, "<C-s>", "<cmd>:w<Cr>", { silent = true })
vim.keymap.set({ "i", "n" }, "<C-q>", "<cmd>:q<Cr>", { silent = true })
vim.keymap.set({ "i", "n" }, "<C-p>", "<cmd>:Telescope fd hidden=true<Cr>", { silent = true })
vim.keymap.set({ "i", "n" }, "<A-Left>", "<cmd>:bnext<Cr>", { silent = true })
vim.keymap.set({ "i", "n" }, "<A-Right>", "<cmd>:bprevious<Cr>", { silent = true })
