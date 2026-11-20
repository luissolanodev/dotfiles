# System install, or the per-user install used where admin rights are missing.
for brew in /opt/homebrew/bin/brew ~/homebrew/bin/brew
    if test -x $brew
        $brew shellenv fish | source
        exit
    end
end

echo "Please install 'brew' first!"
