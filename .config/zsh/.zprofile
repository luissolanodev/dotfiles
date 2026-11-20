# Runs after macOS path_helper, so PATH order set here sticks.

# System install, or the per-user install used where admin rights are missing.
for brew in /opt/homebrew/bin/brew ~/homebrew/bin/brew; do
  if [[ -x $brew ]]; then
    eval "$($brew shellenv)"
    break
  fi
done
unset brew

typeset -U path
path=(~/.local/bin $PNPM_HOME $CARGO_HOME/bin $path)
