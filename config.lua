-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "vscode"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
lvim.leader = "space"


vim.cmd("set showmatch")
vim.cmd("set wildmode=list,longest")

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["H"] = ":bp<CR>"
lvim.keys.normal_mode["L"] = ":bn<CR>"
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.nvimtree.active = false

lvim.builtin.treesitter.ensure_installed = {
	"lua",
	"rust",
	"toml",
}

vim.g.copilot_filetypes = {
	["*"] = false,
	["rust"] = true,
	["javascript"] = true,
	["lua"] = true,
	["toml"] = true,
}
lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree toggle<CR>", "Explorer" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>Neotree focus<CR>", "Explorer" }


lvim.builtin.which_key.mappings["t"] = {
	name = "Diagnostics",
	t = { "<cmd>TroubleToggle<cr>", "trouble" },
	w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
	d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
	q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
	l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
	r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}


local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

lvim.builtin.which_key.mappings["r"] = {
	name = "Rust",
	r = { "<cmd>RustLsp runnables<Cr>", "Runnables" },
	t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
	m = { "<cmd>RustLsp expandMacro<Cr>", "Expand Macro" },
	c = { "<cmd>RustLsp openCargo<Cr>", "Open Cargo" },
	p = { "<cmd>RustLsp parentModule<Cr>", "Parent Module" },
	d = { "<cmd>RustLsp debuggables<Cr>", "Debuggables" },
	v = { "<cmd>RustLsp crateGraph<Cr>", "View Crate Graph" },
	R = { "<cmd>RustLsp reloadWorkspace", "Reload Workspace", },
	o = { "<cmd>RustLsp externalDocs<Cr>", "Open External Docs" },
}

lvim.plugins = {
	"Mofiqul/vscode.nvim",
	"github/copilot.vim",
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
	{
		"j-hui/fidget.nvim",
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
  {
    "doctorfree/cheatsheet.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x", -- specify the branch if needed
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    }
  },
}
