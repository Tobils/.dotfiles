-- ~/.config/nvim/lua/plugins/alpha.lua
return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",

    -- =========================
    -- STARTUP LOGIC
    -- =========================
    init = function()
      local args = vim.fn.argv()
      local is_dir = #args == 1 and vim.fn.isdirectory(args[1]) == 1

      if #args == 0 or is_dir then
        vim.defer_fn(function()
          local session_dir = vim.fn.stdpath("state") .. "/sessions"
          local has_session = false

          if vim.fn.isdirectory(session_dir) == 1 then
            local files = vim.fn.glob(session_dir .. "/*", false, true)
            has_session = #files > 0
          end

          if has_session then
            require("persistence").load()
          else
            require("alpha").start()
          end
        end, 0)
      end
    end,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      -- Read from external file
      local ascii_file = vim.fn.stdpath("config") .. "/ascii/tobil.txt"
      local file = io.open(ascii_file, "r")
      local ascii_art = {}

      if file then
        for line in file:lines() do
          table.insert(ascii_art, line)
        end
        file:close()
      end

      dashboard.section.header.val = ascii_art

      -- Buttons
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":FzfLua files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":FzfLua oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":FzfLua live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }

      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)
    end,
  },
}
