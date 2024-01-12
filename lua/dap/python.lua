local M = {}

function M.setup()
  local dap = require("dap")
  dap.adapters.python = {
    type = "executable",
    -- change to your path
    -- if can not find OpenDebugAD7, please install cpptools by mason
    -- command = 'C:\\Users\\yuxuan_chen\\AppData\\Local\\Programs\\Python\\Python311\\python.exe';
    -- 注意; 和 ,
    command = 'python';
    -- command = os.getenv("VIRTUAL_ENV") .. "/bin/python",
    args = { '-m', 'debugpy.adapter' };
  }
  dap.configurations.python = {
    -- launch exe
    {
      name = "Launch file",
      type = "python",
      request = "launch",
      program = "${file}",
      pythonPath = function()
        -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        -- return '${workspaceFolder}\\pipenv run py'
        return 'python'
      end;
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
      console = "integratedTerminal",
      setupCommands = {
        {
          description = 'enable pretty printing',
          text = '-enable-pretty-printing',
          ignoreFailures = false
        },
      },
    },

    {
        name = "Launch file(pipenv)",
        type = "python",
        request = "launch",
        program = "${file}",
        pythonPath = function()
          -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            -- command = '${workspaceFolder}\\pipenv --venv'
            command = 'pipenv --venv'
            f = assert(io.popen(command, 'r'))
            s = assert(f:read('*line'))
        --   result = os.execute([command])
        --   print("this is a bug")
        --   print(result)
            return s .. '\\Scripts\\python'
        --   return 'python'
        end;
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        console = "integratedTerminal",
        setupCommands = {
          {
            description = 'enable pretty printing',
            text = '-enable-pretty-printing',
            ignoreFailures = false
          },
        },
      },
  }



end

return M
