function fish_right_prompt --description 'Write the right prompt'
	set -l my_status $status
    if test $my_status -ne 0
        echo -n -s (set_color af0000 red) "$my_status ! " (set_color reset)
    end
	if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold --background red white
                echo '[N]'
            case insert
                set_color --bold normal
                echo '[I]'
            case replace_one
                set_color --bold --background green white
                echo '[R]'
            case visual
                set_color --bold --background magenta white
                echo '[V]'
        end
        set_color normal
        echo -n ' '
    end
end
