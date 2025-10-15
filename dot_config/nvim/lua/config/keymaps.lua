-- <leader>y copies selection/line to system clipboard reliably (OSC52-aware)
vim.keymap.set({ "n", "v" }, "<leader>y", function()
	local ok, osc52 = pcall(require, "osc52")
	if ok then
		osc52.copy_register("+")
	else
		vim.cmd.normal({ args = { '"+y' } })
	end
end, { desc = "Yank to system clipboard" })
