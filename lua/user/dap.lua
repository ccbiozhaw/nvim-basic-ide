local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end


require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

--[[ require('dap-python').setup("python", {}) ]]

--[[ local dap_install_status_ok, dap_install = pcall(require, "dap-install") ]]
--[[ if not dap_install_status_ok then ]]
--[[   return ]]
--[[ end ]]
--[[]]
--[[ dap_install.setup {} ]]
--[[]]
--[[ dap_install.config("python", {}) ]]

-- add other configs here

require("dapui").setup({
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
