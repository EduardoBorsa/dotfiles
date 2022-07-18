local M = {}

M.close_buffer = function(force)
  if vim.bo.buftype == "terminal" then
    vim.api.nvim_win_hide(0)
    return
  end

  local fileExists = vim.fn.filereadable(vim.fn.expand "%p")
  local modified = vim.api.nvim_buf_get_option(vim.fn.bufnr(), "modified")

  -- if file doesnt exist & its modified
  if fileExists == 0 and modified then
    print "no file name? add it now!"
    return
  end

  force = force or not vim.bo.buflisted or vim.bo.buftype == "nofile"

  -- if not force, change to prev buf and then close current
  local close_cmd = force and ":bd!" or ":bp | bd" .. vim.fn.bufnr()
  vim.cmd(close_cmd)
end

M.load_config = function()
  local conf = {}

  -- attempt to load and merge a user config
  local chadrc_exists =
      vim.fn.filereadable(vim.fn.stdpath "config" .. "/lua/custom/chadrc.lua") == 1
  if chadrc_exists then
    -- merge user config if it exists and is a table; otherwise display an error
    local user_config = require "custom.chadrc"
    if type(user_config) == "table" then
      conf = vim.tbl_deep_extend("force", {}, user_config)
    else
      error "User config (chadrc.lua) *must* return a table!"
    end
  end

  return conf
end

return M
