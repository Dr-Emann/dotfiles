function fish_prompt --description 'Write out the prompt'
	set -l my_status $status
	set -l prompt_color ff8700 yellow
    set -l cwd_color $fish_color_cwd
    if test (id -u) -eq 0
        if set -q fish_color_cwd_root
            set cwd_color $fish_color_cwd_root
        end
    end
    if test $my_status -ne 0
        set cwd_color af0000 red
    end

    echo -s (set_color $prompt_color) '🐟' "$USER" @ (prompt_hostname) '➜  ' (set_color $cwd_color) (prompt_pwd) (set_color reset) (__fish_vcs_prompt)
    echo -n -s (set_color $prompt_color) "ᐅ  " (set_color reset)
end
