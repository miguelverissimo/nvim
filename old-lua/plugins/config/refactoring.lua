local plugin_loaded, refactoring = pcall(require, "refactoring")
if not plugin_loaded then return end

refactoring.setup({})
