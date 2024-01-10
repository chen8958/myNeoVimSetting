-- 基础设置
require('basic')

---快捷键映射
require('keybindings')

--- Packer插件管理
require('plugins')

--- need to be optimized
vim.cmd[[colorscheme tokyonight-night]]

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
----


-- empty setup using defaults
-- require("nvim-tree").setup()
require("plugin-config.nvim-tree")

require("plugin-config.telescope")

require("plugin-config.bufferline")

require("plugin-config.nvim-treesitter")