local M = {}

function M.setup()
    local dap = require('dap')
    dap.adapters.lldb = {
        type = 'executable',
        -- command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
        command = 'C:/Program Files/LLVM/bin/lldb-vscode.exe',
        -- command = "lldb-vscode",
        name = 'lldb'
    }

    -- local config = {
    --     configurations = vscode.dap.configurations.load("${workspaceFolder}/.vscode/launch.json")
    --   }
    -- dap.configurations.cpp = config
    dap.configurations.cpp = {
        {
          name = 'Launch',
          type = 'lldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          MIMode = 'lldb'
          args = {},
      
          -- 💀
          -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
          --
          --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
          --
          -- Otherwise you might get the following error:
          --
          --    Error on launch: Failed to attach to the target process
          --
          -- But you should be aware of the implications:
          -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
          -- runInTerminal = false,
          env = function()
            local variables = {}
            for k, v in pairs(vim.fn.environ()) do
              table.insert(variables, string.format("%s=%s", k, v))
            end
            return variables
          end,
        },
        
      }
    dap.configurations.c = dap.configurations.cpp



end

return M
