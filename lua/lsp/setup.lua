require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  local status, mason = pcall(require, "mason")
  if not status then
    vim.notify("没有找到 mason")
    return
  end
  
  local status, mason_config = pcall(require, "mason-lspconfig")
  if not status then
    vim.notify("没有找到 mason-lspconfig")
    return
  end
  
  local status, lspconfig = pcall(require, "lspconfig")
  if not status then
    vim.notify("没有找到 lspconfig")
    return
  end
  
  -- :h mason-default-settings
  -- ~/.local/share/nvim/mason
  mason.setup({

    --  for fix old pip issue
    -- pip = {
    --     upgrade_pip = true,
    --     install_args = {"--upgrade-deps"},
    -- },
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    }

  })
  
  -- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
  -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
  mason_config.setup({
    ensure_installed = {
      "lua_ls",
      "clangd",
      "cmake",
      "pylsp"
    },
  })
  


--   -- 安装列表
--   -- { key: 服务器名， value: 配置文件 }
--   -- key 必须为下列网址列出的 server name，不可以随便写
--   -- https://github.com/williamboman/nvim-lsp-installer#available-lsps
--   local servers = {
--     -- lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
--     clangd = require("lsp.config.clangd"),
-- --     cmake = require("lsp.config.cmake"),
-- --     pylsp = require("lsp.config.python"),
--   }
  
--   for name, config in pairs(servers) do
--     if config ~= nil and type(config) == "table" then
--       -- 自定义初始化配置文件必须实现on_setup 方法
--       -- lspconfig[name] == LSP server
--       config.on_setup(lspconfig[name])
--     else
--       -- 使用默认参数
--       -- lua語法中 lspconfig.name等價於 lspconfig[name]
--       lspconfig[name].setup({})
--     end
--   end

local servers = {
    -- lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
    clangd = require("lsp.config.clangd"),
}

lspconfig.clangd.setup {}
lspconfig.pylsp.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>, 太麻煩了 要改鍵
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- may not work
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- 
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- you must combo the action fast
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
  