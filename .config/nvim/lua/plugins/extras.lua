local ai_tool = "plugins.extras.tabnine"
local use_copilot = vim.env.LOCAL_DEV_USE_COPILOT
if use_copilot == "true" then
  ai_tool = "plugins.extras.copilot"
end
return {
  { import = "plugins.extras.lang.java" },
  { import = "plugins.extras.lang.python" },
  { import = "plugins.extras.lang.nodejs" },
  { import = "plugins.extras.lang.svelte" },
  { import = ai_tool },
}
