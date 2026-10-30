return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        -- Tab accepts the highlighted suggestion (falls back to snippet
        -- jump, then to a normal <Tab> if there's nothing to accept/jump to)
        ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
        -- Enter also accepts the highlighted suggestion, same as Tab
        ["<CR>"] = { "select_and_accept", "fallback" },
        -- So does the right arrow, same as Tab/Enter
        ["<Right>"] = { "select_and_accept", "fallback" },
        -- Esc closes the completion menu (undoing any preview) instead of
        -- leaving a suggestion lingering, then falls back to normal <Esc>
        ["<Esc>"] = { "cancel", "fallback" },
        -- Windows Terminal doesn't forward Ctrl+Space to console apps at all
        -- (confirmed empirically), so <C-l> is the manual trigger instead
        ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
      },
    },
  },
}
