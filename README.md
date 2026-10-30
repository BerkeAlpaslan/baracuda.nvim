# 💤 Baracuda — Personal LazyVim Config

A personal Neovim configuration built on top of the [LazyVim](https://github.com/LazyVim/LazyVim) starter template, assembled by hand-typing along with [Takuya Matsuyama's (craftzdog)](https://github.com/craftzdog) devaslife YouTube setup — [watch it here](https://www.youtube.com/watch?v=fFHlfbKVi30).

## Requirements

- Neovim >= 0.10
- [git](https://git-scm.com/)
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- [ripgrep](https://github.com/BurntSushi/ripgrep) and [fd](https://github.com/sharkdp/fd) for Telescope
- A C compiler and [CMake](https://cmake.org/) (used to build `telescope-fzf-native.nvim` on Windows, where `make` usually isn't available)
- `node` for some LSP servers (TypeScript, ESLint, Prettier, Tailwind, CSS)

## Structure

```
lua/
├── baracuda/          -- personal, standalone utility modules
│   └── discipline.lua -- nags you ("Hold it Cowboy!") if you spam hjkl instead of using motions
├── config/
│   ├── autocmds.lua   -- custom autocommands (on top of LazyVim's defaults)
│   ├── keymaps.lua    -- custom keymaps (on top of LazyVim's defaults)
│   ├── lazy.lua        -- lazy.nvim bootstrap + plugin spec imports
│   └── options.lua     -- custom options (on top of LazyVim's defaults)
└── plugins/
    ├── colorscheme.lua -- solarized-osaka.nvim (transparent background)
    ├── coding.lua       -- inc-rename.nvim, blink.cmp completion keymaps
    ├── editor.lua        -- telescope.nvim + telescope-file-browser.nvim, flash.nvim disabled
    ├── lsp.lua            -- extra Mason-installed tools
    ├── treesitter.lua     -- extra Treesitter parsers + MDX filetype support
    └── ui.lua               -- noice, notify, bufferline, lualine, incline, mini.animate, dashboard
```

## What's on top of the LazyVim starter

**Colorscheme:** [solarized-osaka.nvim](https://github.com/craftzdog/solarized-osaka.nvim) with a transparent background.

**LazyVim extras enabled** (`lua/config/lazy.lua`):
- `editor.telescope` — fuzzy finder, with `telescope-fzf-native.nvim` and `telescope-file-browser.nvim`
- `ui.dashboard-nvim` — custom ASCII start screen
- `editor.inc-rename` — incremental LSP rename with a live preview on `<leader>cr`
- `linting.eslint`, `formatting.prettier`
- `lang.rust`, `lang.typescript`, `lang.json` — Rust, TypeScript/JavaScript, JSON
- `lang.dotnet` — C#/.NET (Omnisharp, debugging, `csharpier` formatting)
- `lang.markdown` — Markdown (`marksman` LSP, live preview); the bundled `markdownlint-cli2` linter is disabled in `lua/plugins/lsp.lua` since its default rules (80-char lines, no inline HTML, ...) fire on almost every line of normal prose
- `lang.sql` — SQL (`vim-dadbod`/`dbui` client, `sqlfluff` linting)
- `lang.docker` — Dockerfile/Compose (`dockerls`, `hadolint` linting)
- `lang.yaml` — YAML (`yamlls` with schema store support)
- `util.mini-hipatterns`
- `ui.treesitter-context` — sticky scroll: pins the current block/function's opening line(s) at the top of the window while scrolling (`<leader>ut` to toggle)

**Extra Mason tools** (`lua/plugins/lsp.lua`, not tied to a LazyVim extra): `powershell_es` for PowerShell (`.ps1`), plus Lua/shell tooling (`stylua`, `selene`, `luacheck`, `shellcheck`, `shfmt`) and a few web LSPs (`tailwindcss-language-server`, `typescript-language-server`, `css-lsp`).

**Discipline:** `lua/baracuda/discipline.lua` throttles `h`/`j`/`k`/`l` — spam one of them 10+ times in under 2 seconds and it nudges you ("Hold it Cowboy! 🤠") instead of moving the cursor, to encourage using proper motions/search instead.

## Keymaps

> LazyVim already ships with a large set of default keymaps (see `:checkhealth lazyvim` or the [LazyVim keymaps docs](https://www.lazyvim.org/keymaps)). This table only covers what this config adds or changes on top of those defaults.

### General

| Key       | Mode   | Action                                                        |
| --------- | ------ | -------------------------------------------------------------- |
| `+`       | Normal | Increment the number under the cursor                         |
| `-`       | Normal | Decrement the number under the cursor                         |
| `dw`      | Normal | Delete a word backwards without overwriting a register        |
| `<C-a>`   | Normal | Select the entire buffer                                      |
| `<C-m>`   | Normal | Jump forward in the jumplist (replaces the default Enter behavior) |
| `<C-j>`   | Normal | Jump to the next diagnostic                                    |
| `<C-BS>`  | Insert | Delete the previous word, like Windows (also bound to `<C-h>`, since that's what this terminal actually sends) |

### Tabs

| Key        | Mode   | Action                                  |
| ---------- | ------ | ---------------------------------------- |
| `te`       | Normal | Open `:tabedit` (type a path, then Enter) |
| `<Tab>`    | Normal | Go to the next tab                       |
| `<S-Tab>`  | Normal | Go to the previous tab                   |

### Windows

| Key                              | Mode   | Action                          |
| --------------------------------- | ------ | -------------------------------- |
| `ss`                               | Normal | Split window horizontally        |
| `sv`                               | Normal | Split window vertically          |
| `sh` / `sj` / `sk` / `sl`          | Normal | Move focus left/down/up/right    |
| `<C-w><left>` / `<C-w><right>`     | Normal | Shrink/grow window width         |
| `<C-w><up>` / `<C-w><down>`        | Normal | Grow/shrink window height        |

### Telescope (`lua/plugins/editor.lua`)

| Key           | Action                                                     |
| ------------- | ------------------------------------------------------------ |
| `;f`          | Find files (includes hidden files)                          |
| `;r`          | Live grep                                                    |
| `;t`          | Help tags                                                    |
| `;;`          | Resume the last picker                                       |
| `;e`          | Diagnostics                                                   |
| `;s`          | Treesitter symbols                                             |
| `\\`          | List open buffers                                              |
| `sf`          | Open the file browser in the current file's directory         |
| `<leader>fP`  | Find a file inside an installed plugin                        |

### LSP / editing extras

| Key            | Action                                                                 |
| -------------- | ------------------------------------------------------------------------ |
| `<leader>cr`   | Rename the symbol under the cursor with a live preview (inc-rename.nvim) |
| `<leader>cp`   | Toggle the Markdown preview (Markdown files only)                       |

### Completion (`lua/plugins/coding.lua`)

| Key      | Mode   | Action                                                                 |
| -------- | ------ | ------------------------------------------------------------------------ |
| `<Tab>` / `<CR>` / `<Right>` | Insert | Accept the highlighted suggestion (`<Tab>` also jumps to the next snippet placeholder, or just inserts a tab, if there's nothing to accept) |
| `<Esc>`  | Insert | Close the completion menu (undoing any preview) instead of leaving it open |
| `<Up>` / `<Down>` | Insert | Move through the suggestion list                               |
| `<C-l>`  | Insert | Manually open the completion menu (`<C-space>` doesn't work here — Windows Terminal doesn't forward Ctrl+Space to console apps) |

## Installation

> [!WARNING]
> This will overwrite your current Neovim configuration. Back it up first if needed.

Optionally, [watch the tutorial video](https://www.youtube.com/watch?v=fFHlfbKVi30) this setup is based on first.

```sh
# Linux/macOS
git clone <this-repo-url> ~/.config/nvim

# Windows (PowerShell)
git clone <this-repo-url> $env:LOCALAPPDATA\nvim
```

Start Neovim and let `lazy.nvim` install everything:

```sh
nvim
```

## License

[MIT](LICENSE). Built on top of the [LazyVim](https://github.com/LazyVim/LazyVim) starter template (Apache License 2.0).
