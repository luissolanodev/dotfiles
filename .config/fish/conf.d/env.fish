# Runs before conf.d/fisher.fish, so nvm sees the default version.
source ~/.config/shell/env.sh

# Machine-specific overrides (untracked), e.g. work proxies and certs.
test -f ~/.config/shell/local.sh; and source ~/.config/shell/local.sh

set -g nvm_default_version lts/krypton
