function ls --description 'ls with improved defaults'
    if test (uname) = "Darwin"
        command ls -GTh $argv
    else
        command ls -lh --color=auto $argv
    end
end
