vim.g.mapleader = ' '

-- Directory Navigatio}n
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", { silent = true, noremap = true })

-- -- Pane and Window Navigation
-- mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
-- mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
-- mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
-- mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
-- mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
-- mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
-- mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
-- mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
-- mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
-- mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
-- mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
-- mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- -- Window Management
-- mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
-- mapkey("<leader>sh", "split", "n") -- Split Horizontally
-- mapkey("<C-Up>", "resize +2", "n")
-- mapkey("<C-Down>", "resize -2", "n")
-- mapkey("<C-Left>", "vertical resize +2", "n")
-- mapkey("<C-Right>", "vertical resize -2", "n")

-- Show Full File-Path
vim.keymap.set("n", "<leader>pa", ":echo expand('%:p')<CR>", { silent = true, noremap = true })

-- Save
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true, noremap = true })

-- Close
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true, noremap = true })

-- Quit
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { silent = true, noremap = true })

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- move
-- vim.keymap.set("v", "<A-Up>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
-- vim.keymap.set("v", "<A-Down>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true })

-- Nvim keymaps redefined
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { silent = true, noremap = true })
vim.keymap.set(
	"n",
	"<leader>wr",
	"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
	{ silent = true, noremap = true }
)
vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true, noremap = true })

local api = vim.api

-- Comments
api.nvim_set_keymap("n", "<leader>/", "gtc", { noremap = false })
api.nvim_set_keymap("v", "<leader>/", "goc", { noremap = false })
