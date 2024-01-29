-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	vim.notify("Lazy could not be loaded!", "error")
	return
end

lazy.setup({
	-- General
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"tpope/vim-endwise", -- Help to end certain structures automatically
	{ "ellisonleao/glow.nvim", branch = "main" }, -- Glow preview inside neovim
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"windwp/nvim-ts-autotag", -- Autoclose and autorename html tags
	"numToStr/Comment.nvim", -- Easily comment stuff
	"lewis6991/impatient.nvim",
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	"folke/which-key.nvim",
	"jxnblk/vim-mdx-js",

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

	-- CMP
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-cmdline",
			"David-Kunz/cmp-npm",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
		},
	},

	-- Colorschemes
	"lunarvim/colorschemes", -- Lots of colorschemes
	"folke/tokyonight.nvim",
	"Mofiqul/dracula.nvim",
	"shaunsingh/nord.nvim",

	-- LSP
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"antosha417/nvim-lsp-file-operations",
			config = true,
		},
	},
	"jose-elias-alvarez/null-ls.nvim", -- For formatters and linters
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("nn.lsp.null-ls") -- require your null-ls config here (example below)
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
	},
	"nvim-telescope/telescope-media-files.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	"nvim-treesitter/playground",
	"HiPhish/rainbow-delimiters.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",

	{ "ckipp01/nvim-jenkinsfile-linter", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Git
	"lewis6991/gitsigns.nvim",
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
	},

	-- Nvim tree
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",

	-- Bufferline
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",

	-- Lualine
	"nvim-lualine/lualine.nvim",

	-- Toggleterm
	"akinsho/toggleterm.nvim",

	-- Project
	"ahmedkhalf/project.nvim",

	-- Initial screen
	"goolord/alpha-nvim",

	-- Fix cursor hold | Issue #12587
	"antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight

	-- NeoGen (annotation toolkit)
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
		dependencies = "nvim-treesitter/nvim-treesitter",
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		lazy = true,
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Notifications
	"rcarriga/nvim-notify",

	-- Flutter
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = true,
	},
})
