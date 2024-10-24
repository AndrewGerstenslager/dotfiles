-- Lazy.nvim setup for nvim-ufo with promise-async dependency
return {
	-- nvim-ufo with promise-async
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async", -- Ensure promise-async is installed
		},
		config = function()
			-- Function to customize the fold text with arrows and fold size, no indent numbers
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = ("  ➤ %d "):format(endLnum - lnum) -- Adds an arrow and the number of folded lines
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0

				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end

				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end

			-- Setting up nvim-ufo with the fold handler
			require("ufo").setup({
				fold_virt_text_handler = handler, -- Use custom handler with arrows and fold size
				open_fold_hl_timeout = 150, -- Optional, how long folds stay highlighted when opened
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" } -- Treesitter as main provider, indent as fallback
				end,
			})

			-- Folding keymaps
			vim.keymap.set("n", "zR", require("ufo").openAllFolds) -- Open all folds
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds) -- Close all folds
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds) -- Open folds except specific kinds
			vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- Close folds with a specific level
			vim.keymap.set("n", "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover() -- LSP hover for more info when no fold preview
				end
			end)

			-- Additional folding-related settings
			vim.o.foldcolumn = "0" -- Disable foldcolumn (no indent level numbers on the side)
			vim.o.foldlevel = 99 -- Start with all folds open
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true -- Enable folding by default
		end,
	},
}
