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

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
				args = { "--port", "${port}" }
			},
			name = "codelldb",
		}

		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb",
			name = "lldb",
		}

		local lldb_config = {
			name = 'Launch',
			type = 'lldb',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = {},
		}

		local codelldb_launch_config = {
			type = "codelldb",
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
			codelldb_launch_config,
		}

		dap.configurations.rust = {
			codelldb_launch_config,
		}

		dap.configurations.c = {
			codelldb_launch_config,
		}

		local noremap = require("vandvag.core.utils").noremap

		noremap("n", "<F9>", dap.toggle_breakpoint, "[DAP] Toggle breakpoint")
		noremap("n", "<leader>db", dap.run_to_cursor, "[DAP] Run to cursor")

		vim.keymap.set("n", "<leader>?", function()
			ui.eval(nil, { enter = true })
		end)

		noremap("n", "<F5>", dap.continue, "[DAP] Continue")
		noremap("n", "<F11>", dap.step_into, "[DAP] Step into")
		noremap("n", "<F10>", dap.step_over, "[DAP] Step over")
		noremap("n", "<S-F11>", dap.step_out, "[DAP] Step out")
		noremap("n", "<S-F5>", dap.restart, "[DAP] Restart")

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
