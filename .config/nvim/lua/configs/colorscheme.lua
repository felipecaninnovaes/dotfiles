-- Configure theme scheme
local colorscheme = "dracula"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark" -- or "light" for light mode
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

-- Enables 24-bit RGB color
vim.opt.termguicolors = true

