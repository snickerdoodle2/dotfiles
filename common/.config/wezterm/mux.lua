local wezterm = require("wezterm")
local helpers = require("helpers")

---@type Action
---@diagnostic disable-next-line:undefined-field
local actions = wezterm.action

local M = {}

M.unix_domains = {
	{
		name = "main",
	},
}

M.default_gui_startup_args = { "connect", "main" }
M.default_workspace = "main"

---@param pane Pane
---@return String
local cwd = function(pane)
	---@diagnostic disable-next-line:undefined-field
	return helpers.basename(pane:get_current_working_dir().path)
end

---@param window Window
---@param pane Pane
---@param id String
---@param label String
local select_workspace = function(window, pane, id, label)
	if not id and not label then
		---@diagnostic disable-next-line:undefined-field
		wezterm.log_info("Sessionizer Cancelled")
	else
		if id == "new" then
			window:perform_action(
				actions.SwitchToWorkspace({
					name = cwd(pane),
					spawn = {
						---@diagnostic disable-next-line:undefined-field
						cwd = pane:get_current_working_dir().path,
						args = helpers.default_prog,
					},
				}),
				pane
			)
			return
		end
		window:perform_action(
			actions.SwitchToWorkspace({
				name = label,
			}),
			pane
		)
	end
end

---@param name string
local rename_workspace = function(_, _, name)
	if name then
		---@diagnostic disable-next-line:undefined-field
		wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), name)
	end
end

---@param window Window
---@param pane Pane
M.sessionizer = function(window, pane)
	local workspaces = {
		{
			id = "new",
			label = string.format("Create New Session (%s)", cwd(pane)),
		},
	}

	---@diagnostic disable-next-line:undefined-field
	for _, workspace in pairs(wezterm.mux.get_workspace_names()) do
		table.insert(workspaces, { label = workspace, id = workspace })
	end

	window:perform_action(
		actions.InputSelector({
			title = "Sessionizer",
			choices = workspaces,
			---@diagnostic disable-next-line:undefined-field
			action = wezterm.action_callback(select_workspace),
			fuzzy = true,
			fuzzy_description = "Select session: ",
		}),
		pane
	)
end

M.rename = function(window, pane)
	window:perform_action(
		actions.PromptInputLine({
			description = "Rename workspace",
			---@diagnostic disable-next-line:undefined-field
			initial_value = wezterm.mux.get_active_workspace(),
			---@diagnostic disable-next-line:undefined-field
			action = wezterm.action_callback(rename_workspace),
		}),
		pane
	)
end

return M
