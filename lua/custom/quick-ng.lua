local function is_angular_project()
	return vim.fs.find("angular.json", { upward = true })[1] ~= nil
end

local function get_component_basename(filepath)
	return filepath:match("(.+)%..+$")
end

local function switch_to(extension)
	local base = get_component_basename(vim.api.nvim_buf_get_name(0))
	if not base then
		return
	end
	local target = base .. "." .. extension
	if vim.fn.filereadable(target) == 1 then
		vim.cmd("edit " .. target)
	else
		vim.notify("No " .. extension .. " file found", vim.log.levels.WARN)
	end
end

if is_angular_project() then
	vim.keymap.set("n", "<leader>ah", function() switch_to("html") end, { desc = "Component HTML" })
	vim.keymap.set("n", "<leader>ac", function() switch_to("css") end, { desc = "Component CSS" })
	vim.keymap.set("n", "<leader>at", function() switch_to("ts") end, { desc = "Component TS" })
end
