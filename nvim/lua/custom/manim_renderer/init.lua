local M = {}

function M.get_class_name()
	local node = vim.treesitter.get_node()
	while node do
		if node:type() == "class_definition" then
			local name_node = node:field("name")[1]
			if name_node then
				return vim.treesitter.get_node_text(name_node, 0)
			end
		end
		node = node:parent()
	end
	return nil
end

function M.render_scene()
	local class_name = M.get_class_name()
	if not class_name then
		print("No class name found at cursor!")
		return
	end

	local file_path = vim.fn.expand("%:p")
	local dir_name = vim.fn.expand("%:p:h")
	local file_name = vim.fn.expand("%:t:r")
	local video_path = dir_name .. "/media/videos/" .. file_name .. "/480p15/" .. class_name .. ".mp4"

	local cmd = string.format("manim -ql '%s' '%s' && ffplay -autoexit '%s'", file_path, class_name, video_path)

	print("Running command: " .. cmd)

	require("toggleterm.terminal").Terminal
		:new({
			cmd = cmd,
			direction = "float",
			close_on_exit = false,
		})
		:toggle()
end

return M
