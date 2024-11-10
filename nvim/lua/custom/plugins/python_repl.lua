return {
	{
		--"pappasam/nvim-repl",
		dir = "/home/andrew/repo/public_repos/nvim-repl",
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
			{
				"<leader>rf",
				"<cmd>ReplClose<cr><cmd>ReplToggle<cr>ggVG<Plug>ReplSendVisual",
				desc = "Send entire file to REPL",
			},

			-- Keymaps for navigating cells
			{ "<leader>rj", "<cmd>let @/='# %%'<cr>n<cmd>noh<cr>", desc = "Jump to next cell" },
			{ "<leader>rk", "<cmd>let @/='# %%'<cr>N<cmd>noh<cr>", desc = "Jump to previous cell" },
			{ "<leader>ra", "O# %%<Esc>", desc = "Insert cell marker above" },
		},
	},
}
