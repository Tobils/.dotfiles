-- ~/.config/nvim/lua/plugins/alpha.lua
return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
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
