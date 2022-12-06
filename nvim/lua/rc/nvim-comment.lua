-------------------------------------------------
-- rc/nvim-comment
-------------------------------------------------

local status, nvim_comment = pcall(require, "nvim_comment")

if not status then
	print("not loaded nvim_comment")
	return
end

nvim_comment.setup({
	line_mapping = "<leader>c",
	operator_mapping = "<C-_>",
	comment_chunk_text_object = "ic",
})
