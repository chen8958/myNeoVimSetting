-- 基础设置
require('basic')

---快捷键映射
require('keybindings')

--- Packer插件管理
require('plugins')

require('theme.tokyonight')


-- empty setup using defaults
-- require("nvim-tree").setup()
require("plugin-config.nvim-tree")

require("plugin-config.telescope")

require("plugin-config.bufferline")

require("plugin-config.nvim-treesitter")

require("lsp.setup")

require("dap.setup")

