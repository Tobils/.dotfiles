-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>fg")

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

vim.keymap.set("n", "<leader>gf", function()
  require("fzf-lua").git_files()
end, { desc = "Git Files" })

-- <leader>gf → Git Files (fzf-lua)
vim.keymap.set("n", "<leader>gf", function()
  require("fzf-lua").git_files()
end, { desc = "Git Files" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
