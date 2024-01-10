local status, bufferline= pcall(require, "bufferline")
if not status then
  vim.notify("没有找到 bufferline")
  return
end

require("bufferline").setup()


pcall(bufferline.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(bufferline.load_extension, "ui-select")
