local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement number
keymap.set("n", "+", "C-a>")
keymap.set("n", "-", "C-x>")

-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- save file and quit
keymap.set("n", "<leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", "quit<Return>", opts)
keymap.set("n", "<Leader>Q", "qa<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "tn", ":tabnext<Return>", opts)
keymap.set("n", "tp", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move Window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)

keymap.set("n", "<C-k>", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, opts)
