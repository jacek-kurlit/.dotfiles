local ai_code_tool = "plugins.extras.ai.codeium"
-- TODO: uncomment when this plugin will fix esc issue
-- local use_copilot = vim.env.LOCAL_DEV_USE_COPILOT
-- if use_copilot == "true" then
--   ai_code_tool = "plugins.extras.ai.copilot"
-- end

return {
  -- turned off for now
  -- { import = ai_code_tool },
  { import = "plugins.extras.ai.code_companion" },
}
