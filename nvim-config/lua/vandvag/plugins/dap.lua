return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
	},
	event = "VeryLazy",
	config = function()
		local dap = require("dap")
		local ui = require("dapui")
		local dap_go = require("dap-go")

		ui.setup()
		dap_go.setup()

		require("nvim-dap-virtual-text").setup {
			display_callback = function(variable)
				if #variable.value > 15 then
					return " " .. string.sub(variable.value, 1, 15) .. "... "
				end

				return " " .. variable.value
			end
		}

		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb",
			name = "lldb",
		}

		local lldb_launch_config = {
			type = "lldb",
			name = "Launch Debugger",
			request = "launch",
			cwd = "${workspaceFolder}",
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			stopOnEntry = false,
			args = {},
		}

		dap.configurations.cpp = {
			lldb_launch_config,
		}

		dap.configurations.rust = {
			lldb_launch_config,
		}

		dap.configurations.c = {
			lldb_launch_config,
		}

		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>db", dap.run_to_cursor)

		vim.keymap.set("n", "<leader>?", function()
			ui.eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<F5>", dap.continue)
		vim.keymap.set("n", "<F11>", dap.step_into)
		vim.keymap.set("n", "<F10>", dap.step_over)
		vim.keymap.set("n", "<S-F11>", dap.step_out)
		vim.keymap.set("n", "<S-F5>", dap.restart)

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end,
}
