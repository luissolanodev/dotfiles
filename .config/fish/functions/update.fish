function update -d "update brew, fish plugins, completions and macOS"
    echo 'updating homebrew'
    brew update
    and brew upgrade
    and brew cleanup

    echo 'updating fish shell'
    functions -q fisher; and fisher update
    fish_update_completions

    echo 'checking Apple updates'
    /usr/sbin/softwareupdate -ia
end
