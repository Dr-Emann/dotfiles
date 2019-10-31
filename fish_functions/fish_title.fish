function fish_title
    set -l cmd (status current-command) (prompt_pwd)
    if test $cmd[1] = "fish"
        set -e cmd[1]
    end
    echo -- $cmd
end
