local status, dap = pcall(require, "dap")
if not status then
  return
end

local dap_status, dapui = pcall(require, "dapui")
if not dap_status then
  return
end

require("dap.nvim-dap.ui")

-- local dapui = require("dapui")
dapui.setup({})

-- local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end


dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end


---- keymap
vim.keymap.set({"i", "n", "v"}, "<F5>", "<cmd>lua require'dap'.continue()<CR>", {silent = false, noremap = true, buffer = bufnr})
vim.keymap.set({"i", "n", "v"}, "<F10>", "<cmd>lua require'dap'.step_over()<CR>", {silent = false, noremap = true, buffer = bufnr})
vim.keymap.set({"i", "n", "v"}, "<F11>", "<cmd>lua require'dap'.step_into()<CR>", {silent = false, noremap = true, buffer = bufnr})
vim.keymap.set({"i", "n", "v"}, "<F12>", "<cmd>lua require'dap'.step_over()<CR>", {silent = false, noremap = true, buffer = bufnr})
vim.keymap.set({"i", "n", "v"}, "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = false, noremap = true, buffer = bufnr})

require("dap.nvim-dap.config.python").setup()
