return {
	"ojroques/nvim-osc52",
	event = "VeryLazy",
	opts = { silent = true, trim = false },
	config = function(_, opts)
		local ok, osc52 = pcall(require, "osc52")
		if not ok then
			return
		end
		osc52.setup(opts)

		-- Copy yanks to system clipboard via OSC52 when appropriate
		local function on_yank()
			if vim.v.event.operator == "y" and (vim.v.event.regname == "" or vim.v.event.regname == "+") then
				pcall(osc52.copy_register, "+")
			end
		end
		vim.api.nvim_create_autocmd("TextYankPost", { callback = on_yank })
	end,
}
