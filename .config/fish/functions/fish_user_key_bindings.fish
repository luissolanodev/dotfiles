function fish_user_key_bindings
    if test (uname) = Darwin
        bind --preset ctrl-space forward-char
    else
        bind --preset nul -k forward-char
    end
end
