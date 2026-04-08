if set -q ZELLIJ
    function zellij_tab_name_update --on-event fish_preexec
        zellij action rename-tab $argv[1]
    end

    function zellij_tab_name_reset --on-event fish_postexec
        zellij action rename-tab (prompt_pwd --full-length-dirs 1)
    end

    zellij action rename-tab (prompt_pwd --full-length-dirs 1)
end
