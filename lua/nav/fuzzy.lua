-- telescope.nvim configuration
local tlscp = require("telescope.builtin")
local popup = require("utils.popup")
local utils = require("utils")

vim.keymap.set("n","<leader>ff",function ()
    local search_dir = "~/Documents"
    if vim.bo.ft == "fern" then
        search_dir = utils.get_fern_path()
    else
        search_dir = utils.get_project_dir()
    end
	tlscp.find_files({
		no_ignore = true,
		search_dirs = { search_dir },
        previewer = false,
	})
end)
vim.keymap.set("n","<leader>fg",function ()
	local scopeRan,_ = pcall(tlscp.git_files,{
		no_ignore = true,
        use_file_path = true,
        previewer = false,
	})
    if not scopeRan then
        vim.cmd.echohl("WarningMsg")
        vim.cmd.echo("\"Not in a git repo (sorry)\"")
        vim.cmd.echohl("None")
    end
end)
vim.keymap.set("n","<leader>fb",function()
    tlscp.buffers({previewer = false})
end)
vim.keymap.set("n","<leader>fh",function()
    tlscp.help_tags({previewer = true})
end)
vim.keymap.set("n","<leader>fj",function()
    tlscp.jumplist({previewer = false})
end)

local get_dirs_cmd
local MOVE_TO_MAXDEPTH = 5
if utils.is_windows() then
    get_dirs_cmd = table.concat(
        {
            "pwsh -c",
            "\"Get-ChildItem ~ -Directory -Recurse -Depth ",
            tostring(MOVE_TO_MAXDEPTH),
            "| Select-Object -ExpandProperty FullName\"",
        },
        " "
    )
else
    get_dirs_cmd = table.concat({
        "cd $HOME",
        "&&",
        "find *",
        "-maxdepth",
        tostring(MOVE_TO_MAXDEPTH),
        "-type d",
    }, " ")
end
local shell_output = io.popen(get_dirs_cmd,"r")
local dirs = {}
while true do
    local line = shell_output:read()
    if line == nil then
        break
    else
        dirs[#dirs+1] = line
    end
end
shell_output:close()
vim.keymap.set("n","<leader>ed",function()
	popup.telescope_dropdown(
		"Move To!",
		dirs,
		function(path)
			vim.cmd.edit(os.getenv("HOME").."/"..path)
		end
	)
end)
