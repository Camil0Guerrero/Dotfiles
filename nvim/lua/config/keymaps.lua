local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function nmap(shortcut, command, desc)
  map({ "n" }, shortcut, command, { desc = desc })
end

-- Basics
nmap('<leader>w', ':write<CR>', "Write the current buffer")
nmap('<leader>q', ':quit<CR>', "Quit the current buffer")
nmap('<leader>a', ':edit #<CR>', "Switch to the alternate buffer")
-- map({ "n", "t" }, "<leader>t", "<Cmd>split<CR> <Cmd>term<CR>i") --@todo
nmap("<leader>t", "<cmd>Open .<CR>", "Open current directory in Finder")
-- map({ "n" }, "<C-f>", "<Cmd>Open .<CR>", { desc = "Open current directory in Finder (Kitty)" })
map('i', '<C-Backspace>', '<C-w>', { desc = "Remove a word" })
map({ "t" }, "<Esc>", "<C-\\><C-n>", { desc = "Make terminal mode appear normal" })

-- Ergonomics
-- ag = all global
map('n', 'yag', ':%y<CR>', opts)
map('n', 'vag', 'ggVG', opts)
-- zv = fold
-- map('n', 'n', 'nnzzzv')
-- map('n', 'N', 'Nnzzzv')

map({ "n" }, "<C-d>", "<C-d>zz")
map({ "n" }, "<C-u>", "<C-u>zz")

-- select the text block again
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
-- clean the search result
map('n', '<ESC>', ':nohlsearch<CR>', opts)


map('n', "gl", "$", { desc = "Jump: End of line" })
map({ "n", "v", "x" }, "<CR>", ":", { desc = "Open terminal" })

nmap('yu', "yy")
nmap('du', "dd")
nmap('cu', "cc")
nmap('gu', "gg")
nmap('<leader>sl', "1z=")

-- files
map({ "n", "v", "x" }, "<leader>re", ":edit!<CR>", { desc = "Reload current file" })
map({ "n", "v", "x" }, "<leader>v", "<cmd>edit $MYVIMRC<CR>", { desc = "Edit " .. vim.fn.expand("$MYVIMRC") })
map({ "n", "v", "x" }, "<leader>z", "<Cmd>e ~/.zshrc<CR>", { desc = "Edit .zshrc" })
map({ "n", "v", "x" }, "<leader>n", ":norm", { desc = "ENTER NORM COMMAND." })
map({ "n", "v", "x" }, "<leader>o", "<Cmd>source %<CR>", { desc = "Source " .. vim.fn.expand("$MYVIMRC") })
-- map({ "n", "v", "x" }, "<leader>O", "<Cmd>restart<CR>", { desc = "Restart vim." })
map({ "n", "v", "x" }, "<C-s>", [[:s/\V]], { desc = "Enter substitue mode in selection" })
map({ "n", "v", "x" }, "<leader>i", [[<Cmd>tabedit .gitignore<CR>]], { desc = "Enter substitue mode in selection" })
map({ "n", "v", "x" }, "<leader>lf", vim.lsp.buf.format, { desc = "Format current buffer" })
map({ "n", "x" }, "<leader>y", '"+y')
-- map({ "n", "x" }, "<leader>d", '"+d') -- kepmap used to debugging

-- resizes
map({ "n" }, "<M-n>", "<cmd>resize +2<CR>")
map({ "n" }, "<M-e>", "<cmd>resize -2<CR>")
map({ "n" }, "<M-i>", "<cmd>vertical resize +5<CR>")
map({ "n" }, "<M-m>", "<cmd>vertical resize -5<CR>")

-- corrections
-- spellcheck
map({ "n" }, "<leader>c", "1z=")
map({ "n" }, "<C-q>", ":copen<CR>", opts)


-- explorer
map('n', '<leader>f', function()
  local project_root = vim.fs.root(0, '.git') or vim.fn.getcwd()

  require("mini.pick").builtin.files({}, { source = { cwd = project_root } })
end)
-- map('n', '<leader>f', ':Pick files<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>e', ':Oil<CR>')
nmap("<leader>E", ":Neotree<CR>")

-- tabs
map("n", "te", ":tabedit")
map("n", "tw", ":tabclose<Return>", opts)

for i = 1, 8 do
  map({ "n", "t" }, "<Leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>")
end

-- splits
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)

-- Focus window
nmap('<C-d>', ':wincmd h<CR>')
nmap('<C-h>', ':wincmd j<CR>')
nmap('<C-t>', ':wincmd k<CR>')
nmap('<C-n>', ':wincmd l<CR>')

-- Tmux integration
nmap("<C-d>", ':TmuxNavigateLeft<CR>')
nmap("<C-h>", ':TmuxNavigateDown<CR>')
nmap("<C-t>", ':TmuxNavigateUp<CR>')
nmap("<C-n>", ':TmuxNavigateRight<CR>')

-- Diagnostics
map("n", "<C-j>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)

map("n", "<C-k>", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, opts)

-- Debugging
map({ "n" }, '<leader>d', ':DapNew<CR>')
map({ "n" }, '<C-b>', ':DapToggleBreakpoint<CR>')

-- Tools
local ls = require("luasnip")
-- map({ "i", "s" }, "<Tab>", function() ls.expand_or_jump(1) end, opts)
map({ "i", "s" }, "<C-l>", function() ls.jump(1) end, opts)
map({ "i", "s" }, "<C-h>", function() ls.jump(-1) end, opts)

local builtin = require("telescope.builtin")
function git_files() builtin.find_files({ no_ignore = true }) end

map({ "n" }, "<leader>F", builtin.find_files, { desc = "Telescope live grep" })
map({ "n" }, "<leader>sg", git_files)
map({ "n" }, "<leader>sb", builtin.buffers)
map({ "n" }, "<leader>si", builtin.grep_string)
map({ "n" }, "<leader>so", builtin.oldfiles)
map({ "n" }, "<leader>sh", builtin.help_tags)
map({ "n" }, "<leader>sm", builtin.man_pages)
-- map({ "n" }, "<leader>G", builtin.git_commits)
map({ "n" }, "<leader>G", "<Cmd>LazyGit<CR>")
map({ "n" }, "<leader>sr", builtin.lsp_references)
map({ "n" }, "<leader>sd", vim.lsp.buf.definition)
map({ "n" }, "<leader>rn", vim.lsp.buf.rename)
map({ "n" }, "<leader>go", "<cmd>tselect<CR>")
map({ "n" }, "<leader>sg", builtin.diagnostics)
-- map({ "n" }, "<leader>si", builtin.lsp_implementations)
map({ "n" }, "<leader>sT", builtin.lsp_type_definitions)
map({ "n" }, "<leader>sf", builtin.current_buffer_fuzzy_find)
map({ "n" }, "<leader>st", builtin.builtin)
-- map({ "n" }, "<leader>sc", builtin.git_bcommits)
map({ "n" }, "<leader>sk", builtin.keymaps)
map({ "n" }, "<leader>se", "<cmd>Telescope env<CR>")
map({ "n" }, "<leader>sa", require("actions-preview").code_actions)

-- Run files
nmap("<leader>rf", "<cmd>!mix test %<CR>", "Run the test of the file")
nmap("<leader>rt", [[<cmd> execute "!mix test %:" . line('.')<CR>]], "Run the actual test")

local pick = require("mini.pick")
pick.setup({
  mappings = {
    toggle_preview = "<C-Space>",
    toggle_info = "<C-g>",
    refine = "<C-r>",
    move_down = "<Tab>",
    move_up = "<S-Tab>",
  }
})

-- utilities
map('n', '<C-a>', 'gg<S-v>G')

local function pack_clean()
  local active_plugins = {}
  local unused_plugins = {}

  for _, plugin in ipairs(vim.pack.get()) do
    active_plugins[plugin.spec.name] = plugin.active
  end

  for _, plugin in ipairs(vim.pack.get()) do
    if not active_plugins[plugin.spec.name] then
      table.insert(unused_plugins, plugin.spec.name)
    end
  end

  if #unused_plugins == 0 then
    print("No unused plugins.")
    return
  end

  local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
  if choice == 1 then
    vim.pack.del(unused_plugins)
  end
end
map("n", "<leader>pc", pack_clean)
