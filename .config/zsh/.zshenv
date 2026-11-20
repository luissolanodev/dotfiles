source "$HOME/.config/shell/env.sh"

# Machine-specific overrides (untracked), e.g. work proxies and certs.
[[ -f "$HOME/.config/shell/local.sh" ]] && source "$HOME/.config/shell/local.sh"
