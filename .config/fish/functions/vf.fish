function vf -d 'fzf file picker, open in nvim'
    set file (fd --type f | fzf \
        --preview 'bat --color=always --line-range :500 {}' \
        --preview-window 'right:60%' \
        --bind 'ctrl-/:toggle-preview')
    and nvim $file
end
