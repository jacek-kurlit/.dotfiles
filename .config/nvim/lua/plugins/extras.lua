local ai_tool = "plugins.extras.tabnine"
local use_copilot = vim.env.LOCAL_DEV_USE_COPILOT
if use_copilot == "true" then
  ai_tool = "plugins.extras.copilot"
end
return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "plugins.extras.lang.java" },
  { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.lang.python" },
  { import = "plugins.extras.lang.nodejs" },
  { import = ai_tool },
}
