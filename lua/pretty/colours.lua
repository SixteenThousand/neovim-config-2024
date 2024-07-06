-- colourscheme management

-- default
local defaultColourSchemeOn, _ = require,"sonokai")
if defaultColourSchemeOn then
    vim.cmd.colorscheme("sonokai")
else
    vim.cmd.colorscheme("slate")
end

vim.keymap.set("n","<leader>cb",function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end)

local scopeOn,tlscp = pcall(require,"telescope.builtin")
if scopeOn then
	vim.keymap.set("n","<leader>fc",tlscp.colorscheme)
end
