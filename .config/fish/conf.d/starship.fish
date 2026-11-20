status is-interactive || exit

if command -q starship
    starship init fish | source
end
