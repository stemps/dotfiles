-- <leader>T : prompt for a shell command, remember it, run in floating terminal
-- <leader>t : run remembered command, or prompt if none yet

-- Session-local storage for the last command
local last_cmd = nil

-- Open a floating terminal running the given command
local function open_float_terminal(cmd)
  local buf = vim.api.nvim_create_buf(false, true) -- [listed=false, scratch=true]

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = "Shell: " .. cmd,
    title_pos = "center",
  })

  -- Start terminal job
  vim.fn.termopen({ "zsh", "-ic", cmd })

  -- Enter insert mode so terminal is interactive
  vim.cmd("startinsert")

  -- Close window with 'q' in normal mode
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, nowait = true })
end

-- Prompt for a command and remember it
local function prompt_and_run(default_cmd, remember)
  vim.ui.input({
    prompt = "Shell command: ",
    default = default_cmd or "",
  }, function(input)
    if input and input ~= "" then
      if remember then
        last_cmd = input
      end
      open_float_terminal(input)
    end
  end)
end

-- run one off command
vim.keymap.set("n", "<leader>r ", function()
  prompt_and_run("", false)
end, { desc = "Run shell command in floating terminal" })

-- <leader>rT : ask for a command, remember it, run in terminal float
vim.keymap.set("n", "<leader>rT", function()
  prompt_and_run(last_cmd, true)
end, { desc = "Set shell command and run in floating terminal" })

-- <leader>rt : run remembered command, or prompt if none yet
vim.keymap.set("n", "<leader>rt", function()
  if not last_cmd or last_cmd == "" then
    prompt_and_run("", true)
  else
    open_float_terminal(last_cmd)
  end
end, { desc = "Run last shell command in floating terminal" })
