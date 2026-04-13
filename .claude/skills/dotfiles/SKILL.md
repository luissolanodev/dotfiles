---
name: dotfiles
description: This skill should be used when the user asks to add files to dotfiles, commit dotfiles changes, check dotfiles status, or manage their dotfiles repository.
---

# Dotfiles Management

The dotfiles are managed via a bare git repo at `~/.dotfiles` with `$HOME` as the work tree.

## Git Command

```bash
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME <subcommand>
```

## Workflow

1. **Check status**: `git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status`
2. **Stage a file**: `git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add <file>`
3. **Commit**: use conventional commits, one-line message, no description, no parentheses in scope

### Commit style
- `chore: update aerospace config` ✓
- `feat: add new fish function` ✓
- `chore(aerospace): ...` ✗ — no parentheses

## Notes
- Always add files explicitly by path, never use `git add .` or `git add -A`
- Confirm the commit message with the user before committing
