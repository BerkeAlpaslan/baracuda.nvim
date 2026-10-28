return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "powershell-editor-services",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- PowerShell (.ps1); bundle_path is auto-set by mason-lspconfig
        -- once powershell-editor-services is installed above
        powershell_es = {},
      },
    },
  },
  {
    -- markdownlint-cli2's default rules (80-char line length, no inline
    -- HTML, etc.) fire on nearly every line of normal prose, so disable
    -- it entirely; marksman (LSP) and the preview/render plugins are
    -- untouched, only the lint-based warnings go away
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
}
