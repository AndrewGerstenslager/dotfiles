return {
	{
		"pappasam/nvim-repl",
		init = function()
			vim.g["repl_filetype_commands"] = {
				javascript = "node",
				python = "ipython3 --no-autoindent",
			}
		end,
		keys = {
			{ "<leader>rt", "<cmd>ReplToggle<cr>", desc = "Toggle nvim-repl" },
			{ "<leader>rc", "<cmd>ReplRunCell<cr>", desc = "nvim-repl run cell" },
			{ "<leader>rr", "<Plug>ReplSendLine", desc = "Send line to REPL" },
			{ "<leader>rv", "<Plug>ReplSendVisual", desc = "Send visual selection to REPL", mode = "x" },

			-- Keymaps for navigating cells
			{ "<leader>rj", "/#%%<CR>", desc = "Jump to next cell" },
			{ "<leader>rk", "?#%%<CR>", desc = "Jump to previous cell" },
			{ "<leader>rn", "o#%%<Esc>", desc = "Insert new cell marker" },
		},
	},
}
