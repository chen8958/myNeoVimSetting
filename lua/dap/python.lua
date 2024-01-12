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
      name = "Launch file(pipenv)",
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
