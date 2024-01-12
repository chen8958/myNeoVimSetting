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

require("lsp.setup")

require("dap.python").setup()

vim.keymap.set({"i", "n", "v"}, "<F5>", "<cmd>lua require'dap'.continue()<CR>", {silent = true, noremap = true, buffer = bufnr})
vim.keymap.set({"i", "n", "v"}, "<F10>", "<cmd>lua require'dap'.step_over()<CR>", {silent = true, noremap = true, buffer = bufnr})
vim.keymap.set({"i", "n", "v"}, "<F11>", "<cmd>lua require'dap'.step_into()<CR>", {silent = true, noremap = true, buffer = bufnr})
vim.keymap.set({"i", "n", "v"}, "<F12>", "<cmd>lua require'dap'.step_over()<CR>", {silent = true, noremap = true, buffer = bufnr})
vim.keymap.set({"i", "n", "v"}, "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true, noremap = true, buffer = bufnr})

local dap_breakpoint_color = {
    breakpoint = {
        ctermbg=0,
        fg='#993939',
        bg='#31353f',
    },
    logpoing = {
        ctermbg=0,
        fg='#61afef',
        bg='#31353f',
    },
    stopped = {
        ctermbg=0,
        fg='#98c379',
        bg='#31353f'
    },
}

vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

local dap_breakpoint = {
    error = {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    condition = {
        text = 'ﳁ',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
    },
    rejected = {
        text = "",
        texthl = "DapBreakpint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    logpoint = {
        text = '',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint',
    },
    stopped = {
        text = '',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
    },
}
vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)


local dapui = require("dapui")
dapui.setup({})

local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end


dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end
