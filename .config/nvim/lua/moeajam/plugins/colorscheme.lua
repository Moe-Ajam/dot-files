return {
	-- rose-pine configuration
	{
		"rose-pine/neovim",
		priority = 1003,
		config = function()
			require("rose-pine").setup({
				variant = "main", -- Options: auto, main, moon, dawn
				dark_variant = "main",
				dim_inactive_windows = true,
				extend_background_behind_borders = true,
				enable = {
					terminal = true,
					legacy_highlights = true, -- Improves compatibility for older Neovim versions
					migrations = true, -- Handles deprecated options automatically
				},
				styles = {
					bold = true,
					italic = true,
				},
				palette = {}, -- Define custom colors if needed
				groups = {}, -- Define custom highlight groups
				before_highlight = function() end, -- Hook before highlights are applied
				highlight_groups = {
					Normal = { bg = "#000000" }, -- Force pitch black background
					NormalNC = { bg = "#000000" }, -- Inactive windows
					-- LineNr = { bg = "#000000" }, -- Line numbers
					-- SignColumn = { bg = "#000000" }, -- Sidebars
					-- StatusLine = { bg = "#000000" }, -- Bottom status line
					-- StatusLineNC = { bg = "#000000" }, -- Inactive status line
					-- CursorLine = { bg = "#000000" }, -- Cursor line
					-- CursorLineNr = { bg = "#000000" }, -- Cursor line number
					-- WinSeparator = { bg = "#000000" }, -- Window separators
					-- TelescopeNormal = { bg = "#000000" }, -- Telescope background
					-- NvimTreeNormal = { bg = "#000000" }, -- NvimTree background
					-- FloatBorder = { bg = "#000000" }, -- Borders for floating windows
				},
			})

			-- Apply Rosé Pine colorscheme
			vim.cmd("colorscheme rose-pine")

			vim.opt.fillchars:append({ eob = " " }) -- Removes `~` on empty lines
		end,
	},
	{
		-- Onedark configuration
		"navarasu/onedark.nvim",
		priority = 1001, -- Higher priority than rose-pine to make this the default
		config = function()
			require("onedark").setup({
				style = "darker", -- Options: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
				term_colors = true,
				ending_tildes = false, -- Remove ~ on unused lines
				styles = {
					comments = "none",
					functions = "bold",
					keywords = "bold",
					variables = "bold",
				},
			})
			-- vim.cmd("colorscheme onedark")
		end,
	},
	-- Tokyonight colorscheme configuration
	{
		"folke/tokyonight.nvim",
		priority = 1002, -- Adjust priority so that it loads in the order you want
		config = function()
			require("tokyonight").setup({
				style = "night", -- Choose between 'storm', 'night', 'moon', or 'day'
				transparent = false, -- Enable or disable the background transparency
				terminal_colors = true, -- Apply the colorscheme to the terminal
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					functions = { bold = false },
					variables = { bold = false },
				},
			})
			-- Set Tokyonight as the colorscheme
			-- vim.cmd("colorscheme tokyonight")
		end,
	},
}
