-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "<Leader>,tn", ":lua NumeroLinea()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-S-K>", ":m-2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-J>", ":m+<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "p", "pgvy", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>,bn", ":bnext<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>,bp", ":bprevious<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>,bd", ":bdelete<cr>", { noremap = true, silent = true })


vim.api.nvim_set_keymap("n", "<Leader>,do", ":lua vim.diagnostic.enable(true)", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>,dk", ":lua vim.diagnostic.enable(false)", { noremap = true, silent = false })


vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set({ "v", "x" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set(
  { "n", "v", "x" },
  "<leader>yy",
  '"+yy',
  { noremap = true, silent = true, desc = "Yank line to clipboard" }
)
vim.keymap.set(
  { "n", "v", "x" },
  "<leader>Y",
  '"+yy',
  { noremap = true, silent = true, desc = "Yank line to clipboard" }
)
vim.keymap.set({ "n", "v", "x" }, "<C-a>", "gg0vG$", { noremap = true, silent = true, desc = "Select all" })
vim.keymap.set({ "n", "v", "x" }, "P", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
vim.keymap.set(
  "i",
  "<C-p>",
  "<C-r>+",
  { noremap = true, silent = true, desc = "Paste from clipboard from within insert mode" }
)
vim.keymap.set(
  "x",
  "p",
  '"_dP',
  { noremap = true, silent = true, desc = "Paste over selection without erasing unnamed register" }
)


vim.api.nvim_set_keymap("n", "<Leader><", ":IncreaseFont<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>>", ":DecreaseFont<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>0", ":set foldmethod=indent<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>1", ":set foldlevel=0<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>2", ":set foldlevel=1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>3", ":set foldlevel=2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>4", ":set foldlevel=3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>5", ":set foldlevel=4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>6", ":set foldlevel=6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>7", ":set foldlevel=7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>8", ":set foldlevel=8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>9", ":set foldlevel=9<CR>", { noremap = true, silent = true })
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.cmd([[colorscheme solarized-osaka]])

vim.opt.relativenumber = false
vim.opt.scrolloff = 1
vim.opt.ignorecase = true
vim.opt.wrap = true
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- #vim.opt.clipboard = "unnamedplus"
-- Configura la larghezza dei tab
vim.opt.expandtab = true -- Usa spazi invece di tab
vim.opt.tabstop = 4 -- Numero di spazi per un tab
vim.opt.shiftwidth = 4 -- Numero di spazi per un livello di indentazione
vim.opt.softtabstop = 4 -- Tratta i tab come 4 spazi
--vim.cmd("LspStop")
--
-- vim.cmd([[colorscheme solarized-osaka]])

vim.opt.relativenumber = false
vim.opt.scrolloff = 1
vim.opt.ignorecase = true
vim.opt.wrap = true
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- #vim.opt.clipboard = "unnamedplus"
-- Configura la larghezza dei tab
vim.opt.expandtab = true -- Usa spazi invece di tab
vim.opt.tabstop = 4 -- Numero di spazi per un tab
vim.opt.shiftwidth = 4 -- Numero di spazi per un livello di indentazione
vim.opt.softtabstop = 4 -- Tratta i tab come 4 spazi
--vim.cmd("LspStop")
vim.api.nvim_set_hl(0, "LineNr", { fg = "#21c063", bg = "#111317" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#00FF00", bg = "#111317", bold = true })
vim.api.nvim_set_hl(0, "HeirlineModeInsert", { fg = "#111317", bg = "#da1c1c", bold = true })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })       -- finestre non attive
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#111317" })    -- popup e galleggianti
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#111317" })    -- bordo finestre fluttuanti
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#111317" })     -- colonna dei segni
vim.api.nvim_set_hl(0, "VertSplit", { bg = "#111317" })      -- divisione verticale
vim.opt.signcolumn = "no"
vim.opt.termguicolors = true
-- Definisci il colore personalizzat
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#5555ff", fg = "#ffffff" })

-- Applica l'autocomando con il tuo gruppo
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
vim.opt.mouse = "a" 
vim.opt.lazyredraw = true
