-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open floating terminal
local term_buf = nil
local term_win = nil

vim.keymap.set("n", "<leader>t", function()
  -- If terminal window is open → close it (hide only)
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  -- If terminal buffer does NOT exist → create it ONCE
  if not term_buf or not vim.api.nvim_buf_is_valid(term_buf) then
    term_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_call(term_buf, function()
      vim.cmd("terminal")
    end)
  end

  -- Open the floating window using EXISTING buffer
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  term_win = vim.api.nvim_open_win(term_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.cmd("startinsert")
end, { desc = "Toggle Floating Terminal" })

-- OpenCode keymaps
vim.keymap.set("n", "<leader>oc", function()
  require("opencode.api").toggle()
end, { desc = "Toggle OpenCode" })

vim.keymap.set("n", "<leader>oo", function()
  require("opencode.api").open_input()
end, { desc = "Open OpenCode Input" })

vim.keymap.set("n", "<leader>ox", function()
  require("opencode.api").close()
end, { desc = "Close OpenCode" })

vim.keymap.set("n", "<leader>of", function()
  require("opencode.api").focus_input()
end, { desc = "Focus OpenCode Input" })

vim.keymap.set("n", "<leader>oh", function()
  require("opencode.api").close()
end, { desc = "Hide OpenCode" })

-- OpenCode inline chat keymaps
vim.keymap.set("n", "<leader>oa", function()
  require("opencode.api").run("@cursor: ")
end, { desc = "Ask opencode about cursor" })

vim.keymap.set("v", "<leader>oa", function()
  require("opencode.api").run("@selection: ")
end, { desc = "Ask opencode about selection" })

vim.keymap.set("n", "<leader>oA", function()
  require("opencode.api").run()
end, { desc = "Ask opencode" })

vim.keymap.set("n", "<leader>op", function()
  require("opencode.api").select_session()
end, { desc = "Select session" })

vim.keymap.set("n", "<leader>oe", function()
  require("opencode.api").run("Explain @cursor and its context")
end, { desc = "Explain code near cursor" })

-- NvimTree keymaps
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<cr>", { desc = "Focus NvimTree" })

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float({
    focus = true, -- ⬅️ bikin bisa di-select / masuk ke popup
    border = "rounded",
    max_width = 100,
    max_height = 20,
  })
end, { desc = "Show diagnostic" })

-- Debug Go tests
vim.keymap.set("n", "<leader>dt", function()
  require("dap-go").debug_test()
end, { desc = "Debug Go Test" })

vim.keymap.set("n", "<leader>dT", function()
  require("dap-go").debug_last_test()
end, { desc = "Debug Last Go Test" })
