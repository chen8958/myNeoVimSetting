local status, tokyonight= pcall(require, "tokyonight")
if not status then
  vim.notify("没有找到 tokyonight-night")
  return
end

tokyonight.setup({
    style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = false -- Enable this to disable setting the background color
})



vim.cmd[[colorscheme tokyonight-night]]

-- -- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- -- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true
