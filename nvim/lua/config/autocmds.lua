vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'svelte', 'markdown', 'lua', 'rust', 'typescript', 'javascript', 'typescriptreact', 'react', 'elixir', 'heex', 'http', 'docker-file', 'mermaid' },
  callback = function() vim.treesitter.start() end,
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = { 'elixir', 'eelixir', 'heex', 'surface' },
  callback = function(args)
    local matches = vim.fs.find({ 'mix.exs' }, { upward = true, limit = 2, path = args.file })
    local child_or_root_path, maybe_umbrella_path = unpack(matches)
    local root_dir = vim.fs.dirname(maybe_umbrella_path or child_or_root_path)

    if root_dir then
      vim.lsp.start({
        name = "expert",
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/expert", '--stdio' },
        root_dir = root_dir
      })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { 'dockerfile' },
  callback = function()
    vim.lsp.start({
      name = "docker-language-server",
      cmd = { vim.fn.stdpath("data") .. "/mason/bin/docker-langserver", "--stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({ 'Dockerfile', '.git' }, { upward = true })[1]),
    })
  end,
})

vim.filetype.add({
  filename = {
    ['docker-compose.yml'] = 'yaml.docker-compose',
    ['DockerFile'] = "dockerfile"
  }
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern  = "*.jsx, *.tsx",
  group    = vim.api.nvim_create_augroup("TS", { clear = true }),
  callback = function()
    vim.cmd([[set filetype=typescriptreact]])
  end
})
