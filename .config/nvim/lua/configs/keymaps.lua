map = vim.keymap

-- Save and Close
map.set("n", "<C-s>", ":w<CR>", ns)
map.set("i", "<C-s>", ":w<CR>", ns)
map.set("v", "<C-s>", ":w<CR>", ns)
map.set("n", "<C-q>", ":q<CR>", ns)
map.set("i", "<C-q>", ":q<CR>", ns)
map.set("v", "<C-q>", ":q<CR>", ns)


-- Create new tab
map.set("n", "<C-t>", ":tabnew <CR>", ns)

-- Close tab
map.set("n", "<C-w>", ":tabclose <CR>", ns)

-- NeoTree
map.set("n", "C-o", ":NeoTreeFloatToggle<CR>", ns)
map.set("n", "<C-e>", ":NeoTreeFocusToggle<CR>", ns)
