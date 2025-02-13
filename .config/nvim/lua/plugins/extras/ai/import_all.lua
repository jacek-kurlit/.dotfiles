local ai_code_tool = "plugins.extras.ai.codeium"
local use_copilot = vim.env.LOCAL_DEV_USE_COPILOT
if use_copilot == "true" then
  ai_code_tool = "plugins.extras.ai.copilot"
end

return {
  { import = ai_code_tool },
  { import = "plugins.extras.ai.gpt" },
}
