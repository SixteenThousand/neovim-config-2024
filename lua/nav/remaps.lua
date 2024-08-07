-- general navigation remaps; remaps for related to more specific things
-- are in their respective modules
vim.keymap.set("n","<leader>ee",":buffer ")
vim.keymap.set("n","<leader>ef",":find ")

local bookmarks = {
    ["'"] = vim.fn.stdpath("config"),
    [";"] = vim.fn.stdpath("data"),
    ["#"] = os.getenv("XDG_CONFIG_HOME") or "~/.config",
    ["l"] = "~/Projects/Learning",
    ["p"] = "~/Projects",
    ["i"] = "~/Projects/Ideas/ideas.md",
    ["t"] = "~/temp",
}

for key,path in pairs(bookmarks) do
    vim.keymap.set("n","<leader>e"..key, function ()
        vim.cmd.edit(path)
        vim.o.number = true
    end)
end


vim.keymap.set("n","-",function ()
	vim.cmd.edit("%:h")
end)

-- tab stuff
function newtabex()
	vim.cmd.tabnew("%:h")
end
vim.keymap.set({"n","i"},"<C-t>",newtabex) 
vim.keymap.set("t","<C-t>",vim.cmd.tabnew)
vim.keymap.set({"n","i","t"},"<A-Left>",vim.cmd.tabprev)
vim.keymap.set({"n","i","t"},"<A-Right>",vim.cmd.tabnext)
