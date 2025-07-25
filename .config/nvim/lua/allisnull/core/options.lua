vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.scrolloff = 4
vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.backspace = "indent,eol,start"

vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 500

vim.opt.listchars = {
    space = "◦",
    tab = "»—",
    extends = "→",
    precedes = "←",
    nbsp = "␣",
    trail = "×",
    eol = "⏎",
}

vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 100 })
    end,
})

vim.api.nvim_create_augroup("Text", { clear = true})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "text", "markdown" },
    group = "Text",
    callback = function()
        vim.opt.spell = true
    end,
})

vim.api.nvim_create_augroup("HelpBuffer", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "HelpBuffer",
  pattern = "help",
  command = "only",
})

vim.api.nvim_create_augroup("TwoSpaceGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dart", "yaml", "lisp", "scheme", "nix" },
    group = "TwoSpaceGroup",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end,
})

vim.api.nvim_create_augroup("TabGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "txt", "go", "makefile", "haskell" },
    group = "TabGroup",
    callback = function()
        vim.opt.expandtab = false
    end,
})

vim.api.nvim_create_augroup("Obsidian", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = vim.fn.expand("~") .. "/Vault/*.md",
    group = "Obsidian",
    callback = function()
        vim.opt.conceallevel = 1
        vim.opt.wrap = true

        vim.keymap.set("n", "<M-j>", "gj", { noremap = true, silent = true, buffer = true })
        vim.keymap.set("n", "<M-k>", "gk", { noremap = true, silent = true, buffer = true })
    end,
})

vim.g["conjure#highlight#enabled"] = true
