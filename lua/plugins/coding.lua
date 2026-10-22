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
        -- Esc closes the completion menu (undoing any preview) instead of
        -- leaving a suggestion lingering, then falls back to normal <Esc>
        ["<Esc>"] = { "cancel", "fallback" },
      },
    },
  },
}
