# dotfiles

My macOS config for fish and zsh, kept in a bare git repo with `$HOME` as the work tree.
I use fish at home and zsh at work, so both shells load the same environment and get
the same highlighting, autosuggestions, completions, abbreviations, prompt (starship)
and `z` (zoxide).

## Install

```bash
# 1. Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Dotfiles
git clone --bare https://github.com/luissolanodev/dotfiles.git ~/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config status.showUntrackedFiles no

# 3. Packages
brew bundle --global                                      # shared
brew bundle --file ~/.config/homebrew/Brewfile.personal   # personal Mac only
```

If `checkout` fails because files already exist, move them aside and run it again.

### fish

```bash
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'
```

### zsh

Plugins install themselves on first launch. For Node, install nvm into `~/.config/nvm`:

```bash
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash'
```

## Layout

```text
~/.zshenv                    points zsh at ~/.config/zsh
~/.config/
├── shell/env.sh             shared env vars, sourced by both shells
├── shell/local.sh           machine-specific overrides (untracked)
├── fish/                    config.fish, conf.d/, functions/, fish_plugins
├── zsh/                     .zshrc, .zprofile, .zsh_plugins.txt, functions/
├── homebrew/                Brewfile, Brewfile.personal
├── ghostty/  aerospace/  borders/  bat/
```

The repo tracks the plugin lists, not the plugins. fisher installs into
`~/.local/share/fisher` and antidote into `~/.local/share/antidote`.

## Daily use

`dot` is git for this repo. Both shells have the same abbreviations:

| Abbr   | Expands to                  |
| ------ | --------------------------- |
| `dst`  | `dot status`                |
| `dss`  | `dot status --short`        |
| `da`   | `dot add`                   |
| `dd`   | `dot diff`                  |
| `dcd`  | `dot commit -m`             |
| `dps`  | `dot push`                  |
| `dlog` | `dot log --oneline --graph` (decorated, colored) |

`dot status` hides untracked files, so add new ones by path: `dot add ~/.config/foo`.

`update` upgrades Homebrew packages, shell plugins and macOS.

## Machine-specific config

Anything private or tied to one machine (work certs, proxies, tokens) goes in
`~/.config/shell/local.sh`. Git ignores it, and both shells load it after `env.sh`,
so it can override shared values. Use plain `export KEY=value` lines; fish reads
this file too.

```bash
export NODE_EXTRA_CA_CERTS="$HOME/certs/company.pem"
```
