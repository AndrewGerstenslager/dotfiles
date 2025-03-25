return {
	{
		dir = "~/repo/dotfiles/nvim/lua/custom/manim_renderer",
		name = "manim-render",
		ft = "python",
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		config = function()
			local manim = require("custom.manim_renderer")
			vim.keymap.set("n", "<leader>mm", manim.render_scene, {
				noremap = true,
				silent = true,
				desc = "Render Manim class under cursor",
			})
		end,
	},
}
