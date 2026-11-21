---
name: dotfiles
description: Use when the user asks to change, add to, check, or commit their dotfiles, or touches shell config (fish, zsh, env vars, PATH, abbreviations, plugins), the Brewfiles, or anything under ~/.config tracked by the bare repo at ~/.dotfiles.
---

# Dotfiles

macOS only. Bare git repo at `~/.dotfiles`, work tree `$HOME`. The user runs fish at home
and zsh at work (work only allows zsh), and wants both shells to behave the same.

The user drives decisions here. Show what exists, wait for their call, and only recommend
when asked.

## Git

```bash
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME <subcommand>
```

The user's shells wrap this as `dot`. Untracked files are hidden (`status.showUntrackedFiles no`),
so new files never show up in `status` until added.

- Stage files explicitly by path. Never `git add .` or `git add -A`.
- Conventional commits, one line, no body, no parentheses in the scope:
  `feat: add zsh setup`, `chore: update ghostty config`. Not `chore(ghostty): ...`.
- Confirm the commit message with the user before committing. Ask before pushing.

## Where things live

| What | File |
|---|---|
| Shared env vars (both shells) | `~/.config/shell/env.sh` |
| Per-machine / private env (untracked, git-ignored) | `~/.config/shell/local.sh` |
| fish | `~/.config/fish/` (`config.fish`, `conf.d/`, `functions/`, `fish_plugins`) |
| zsh entry point | `~/.zshenv` (only sets `ZDOTDIR`, sources `$ZDOTDIR/.zshenv`) |
| zsh | `~/.config/zsh/` (`.zshenv`, `.zprofile`, `.zshrc`, `.zsh_plugins.txt`, `functions/`) |
| Packages | `~/.config/homebrew/Brewfile` (shared), `Brewfile.personal` (personal Mac only) |
| Prompt | starship, `~/.config/starship.toml` (tokyo-night preset) |
| tmux | `~/.config/tmux/tmux.conf`; TPM + plugins auto-install to `~/.local/share/tmux/plugins` (untracked). powerkit needs Homebrew bash 5 ahead of `/bin` in PATH |
| Other tracked config | `ghostty/`, `aerospace/`, `borders/`, `bat/`, `~/.claude/` |

Not in this repo: nvim (its own repo at `~/.config/nvim`), plugin code
(`~/.local/share/fisher`, `~/.local/share/antidote`, `~/.local/share/tmux/plugins`), history and caches.

## Parity rule

Every shell-facing change lands in both shells in the same change. Where each kind goes:

| Change | fish | zsh |
|---|---|---|
| Env var | `env.sh` (shared) | `env.sh` (shared) |
| PATH entry | `fish_add_path` in `config.fish` | `path=(...)` in `.zprofile` |
| Function | `fish/functions/<name>.fish` | `zsh/functions/<name>` (autoloaded body) |
| Short alias | function or `abbr` in `config.fish` | `alias` in `.zshrc` |
| Abbreviation | `abbr` in `config.fish` | `abbr -S -qq` in `.zshrc` (add `--force` if it shadows a command) |
| Plugin | `fisher install`, which updates `fish_plugins` | line in `.zsh_plugins.txt` |
| Tool init (zoxide, starship) | `conf.d/<tool>.fish` | `eval "$(<tool> init zsh)"` in `.zshrc` |
| CLI tool or app | `Brewfile` / `Brewfile.personal` | same |

Node is nvm in both: nvm.fish in fish (default set by `nvm_default_version` in `conf.d/env.fish`),
nvm-sh in zsh (`NVM_DIR=$XDG_CONFIG_HOME/nvm`). Don't swap in mise or fnm; work doesn't allow them.

## Rules

- `env.sh` and `local.sh` hold only plain `export KEY=value` lines. fish sources them, so no
  conditionals, no `$(...)`, no PATH edits.
- Secrets and work-specific values (certs, proxies, tokens, company URLs) go in `local.sh`, never
  in a tracked file.
- Never commit generated files: plugin output, `fish_variables`, `.DS_Store`, caches, history.
- fish `conf.d/` loads alphabetically: `brew.fish`, then `env.fish`, then `fisher.fish`
  (which loads plugin conf.d). Keep env before fisher so nvm sees its default.
- zsh PATH goes in `.zprofile`, not `.zshenv`: macOS `path_helper` reorders PATH after `.zshenv`.
- Homebrew lives at `/opt/homebrew` here and `~/homebrew` at work; both shells check both.

## Verify before reporting done

Test in a clean environment, since the current shell carries old variables:

```bash
env -i HOME=$HOME TERM=xterm-256color USER=$USER PATH=/usr/bin:/bin /opt/homebrew/bin/fish -i -c '<checks>'
env -i HOME=$HOME TERM=xterm-256color USER=$USER PATH=/usr/bin:/bin /bin/zsh -lic '<checks>'
fish -n <file>    # syntax
zsh -n <file>     # syntax
brew bundle check --global
```
