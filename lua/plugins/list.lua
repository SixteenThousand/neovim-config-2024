return {
	-- colourschemes & appearancelist
    "catppuccin/nvim",
	"sainnhe/everforest",
	"rebelot/kanagawa.nvim",
	"marko-cerovac/material.nvim",
	"xero/miasma.nvim",
	"rose-pine/neovim",
	"EdenEast/nightfox.nvim",
	"shaunsingh/nord.nvim",
	"sainnhe/sonokai",
	"ku-s-h/summerfruit256.vim",
	"folke/tokyonight.nvim",
    "Rigellute/shades-of-purple.vim",
	
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
		    options = {
				-- note lualine is also mentioned in the <A-r> remap in 
				-- remap.lua
				-- 
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
		    },
			sections = {
                lualine_a = {"mode"},
                lualine_b = {"filename","branch","diff"},
                lualine_c = {"diagnostics"},
				lualine_x = {"fileformat","encoding","filesize"},
				lualine_y = {"progress","filetype"},
				lualine_z = {"location"},
			},
		},
	},
	"equalsraf/neovim-gui-shim",
	
	
	-- find things! maybe explore some files!!
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case"
			}
		},
	},
	{
		"lambdalisue/fern.vim",
		config = function(plugin)
			-- vimscript plugins don't need to be explicity sourced!
			vim.g["fern#renderer"] = "nerdfont"
			require("nav.manager")
		end,
	},
	{
		"lambdalisue/fern-renderer-nerdfont.vim",
		dependencies = {
			"lambdalisue/nerdfont.vim",
			"lambdalisue/fern.vim",
		},
	},
	{
		"lambdalisue/fern-hijack.vim",
		dependencies = {
			"lambdalisue/fern.vim",
		},
	},
	
	-- LSPs, treesitter, & filetype-specific stuff
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
        config = function()
            require("plugins.treesitter")
        end,
	},
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter" },
    },
	{
		"alvan/vim-closetag",
		config = function(plugin,opts)
			vim.g.closetag_filenames = "*.html,*.xml,*.svg,*.jsx"
			vim.g.closetag_filetypes = "html,xml,svg"
			vim.g.closetag_emptyTags_caseSensitive = 1
			vim.g.closetag_shortcut = ">"
			vim.g.closetag_close_shortcut = "<C-A-F1>"
			-- this one is designed to never be used
		end,
	},
	{
		"lervag/vimtex",
		config = function(plugin,opts)
			vim.cmd("filetype plugin on")
		end,
	},
	"maxmellon/vim-jsx-pretty",
	-- lsps
	"neovim/nvim-lspconfig",
	{
		"williamboman/mason.nvim",
		config = function(plugin,opts)
			require("mason").setup()
		end,
	},
    L3MON4D3/LuaSnip",
    {
        "echasnovski/mini.completion",
        version = false,
        config = function()
            -- require("mini.completion").setup()
            -- vim.g.minicompletion_disable = true
        end,
    },
	
	-- git
	{
		"tpope/vim-fugitive",
		lazy = false,
		config = function(plugins,opts)
            require("plugins.fugitive")
		end,
	},
	
	
    -- misc.
    -- commented out because it conflicts with vim-surround
	--[[ {
		"ggandor/leap.nvim",
		config = function(plugin,opts)
			require("leap").create_default_mappings()
		end,
	}, ]]
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function(plugins,opts)
			require("Comment").setup()
			local commapi = require("Comment.api")
			-- for some reason, "<C-_>" translates to "Ctrl+/"
			vim.keymap.set({"n","i","v"},"<C-_>",commapi.toggle.linewise.current)
			vim.keymap.set({"n","i","v"},"<C-/>",commapi.toggle.linewise.current)
		end,
	},
    "tpope/vim-surround",
    "vim-test/vim-test",
	
	-- fun
	"ThePrimeagen/vim-be-good"
}
