local status, dropbar = pcall(require, "dropbar")
if not status then
  vim.notify("没有找到 dropbar")
  return
end

-- local actions = require("dropbar.actions")
dropbar.setup()


vim.keymap.set(
    {"n","i"},
    "<C-b>",
    "<cmd>lua require('dropbar.api').pick()<CR>",
    {
        noremap = true,
        silent = true,
    }
)



pcall(dropbar.load_extension, "env")
-- To get ui-select loaded and working with dropbar, you need to call
-- load_extension, somewhere after setup function:
pcall(dropbar.load_extension, "ui-select")
