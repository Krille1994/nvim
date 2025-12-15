local util = require("lspconfig.util")

return {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        completion = { callSnippet = "Replace" },
        format = {
          enable = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
          },
        },
      },
    },
  },

  clangd = {
    cmd = { "clangd", "--enable-config" },
  },

  angularls = {
    root_dir = util.root_pattern("angular.json"),
    filetypes = { "typescript", "html" },
    on_new_config = function(new_config, new_root_dir)
      new_config.cmd = {
        "node",
        new_root_dir .. "/node_modules/@angular/language-server/bin/ngserver",
        "--stdio",
        "--tsProbeLocations",
        new_root_dir .. "/node_modules",
        "--ngProbeLocations",
        new_root_dir .. "/node_modules",
        "--logToConsole",
        "--logFile",
        "/tmp/ng-lsp.log",
      }
    end,
  },

  -- only loads schemastore if jsonls is used
  jsonls = function()
    local schemastore = require("schemastore")
    return {
      settings = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = { enable = true },
        },
      },
    }
  end,
}
