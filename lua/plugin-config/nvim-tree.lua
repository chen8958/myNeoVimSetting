
local status, nvim_tree= pcall(require, "nvim-tree")
if not status then
  vim.notify("没有找到 nvim-tree")
  return
end

require("nvim-tree").setup()


pcall(nvim_tree.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(nvim_tree.load_extension, "ui-select")