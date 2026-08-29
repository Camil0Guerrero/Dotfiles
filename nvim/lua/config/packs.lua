vim.pack.add({
  -- UI
  -- Theme
  { src = "https://github.com/folke/tokyonight.nvim" },

  -- Basic navigation
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim",                version = vim.version.range('3') },
  { src = "https://github.com/MunifTanjim/nui.nvim" },


  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/chentoast/marks.nvim" },

  -- explorer
  { src = "https://github.com/echasnovski/mini.pick" },

  -- highlight
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
  -- Visual diagnostic
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },

  -- smart search
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
  { src = "https://github.com/LinArcX/telescope-env.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },

  -- completition
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-path" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
  { src = "https://github.com/aznhe21/actions-preview.nvim" },
  { src = "https://github.com/nvim-mini/mini.pairs" },

  -- language servers
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },

  -- typst
  { src = "https://github.com/chomosuke/typst-preview.nvim" },

  -- Debugging
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
  { src = "https://github.com/julianolf/nvim-dap-lldb" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },

  -- Ergonomic
  { src = "https://github.com/nvim-mini/mini.surround" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },

  -- Tools
  { src = "https://github.com/kdheepak/lazygit.nvim" }
})

-- Theme
require "tokyonight".setup({ priority = 1000, transparent = true })

require "oil".setup({
  lsp_file_methods = {
    enabled = true,
    timeout_ms = 400,
    autosave_changes = true,
  },
  columns = {
    "icon",
  },
  float = {
    max_width = 0.5,
    max_height = 0.5,
    border = "rounded",
  },
})

require "neo-tree".setup({})

require "marks".setup {
  builtin_marks = { "<", ">", "^" },
}

-- Hightlight
require "nvim-treesitter".setup({
  ensure_installed = { "typescript", "elixir", "heex", "html", "javascript", "http" },
  highlight = { enable = true }
})

require "tiny-inline-diagnostic".setup({
  preset = "ghost"
})


-- Smart search
local telescope = require("telescope")
telescope.setup({
  defaults = {
    preview = { treesitter = true },
    color_devicons = true,
    sorting_strategy = "ascending",
    path_displays = { "smart" },
    layout_strategy = "horizontal",
    winblend = 0,
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = "top",
      preview_cutoff = 40,
    }
  }
})

telescope.load_extension("ui-select")

-- Completition
-- disable
vim.opt.completeopt = { "menuone", "noselect", "fuzzy" }

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
  })
})


require "luasnip".setup({
  enable_autosnippets = true
})
require "luasnip.loaders.from_lua".load({ paths = "~/.config/nvim/lua/snippets/" })

require "mason".setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
  ensure_installed = {
    "prettierd",
    "luacheck",
    "shellcheck",
    -- "shfmt",
    "typescript-language-server",
    "css-lsp",
  }
})

require "mini.pick".setup()

require("actions-preview").setup {
  backend = { "telescope" },
  extensions = { "env" },
  telescope = vim.tbl_extend(
    "force",
    require("telescope.themes").get_dropdown(), {}
  )
}

require("mini.pairs").setup()

-- Language servers
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", { capabilities = capabilities })
vim.lsp.config("tinymist", {
  settings = {
    exportPdf = "onSave"
  }
})

vim.lsp.config("bash-language-server", {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'bash' }
})

vim.lsp.enable({ "lua_ls", "emmet_ls", "eslint", "ts_ls", "tinymist", "bash-language-server" })

-- Debugging
require("dap-lldb").setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Ergonomic
require("mini.surround").setup({
  mappings = {
    highlight = ""
  }
})
