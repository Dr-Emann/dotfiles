abbr -a -g c cargo
abbr -a -g g git
abbr -a -g gc 'git commit'
abbr -a -g n ninja

for p in "$HOME/bin" "$HOME/.local/bin" "$HOME/go/bin" "$HOME/.cargo/bin"
    if ! test -d "$p"
        continue
    end

    if ! contains "$p" $PATH
        set PATH "$p" $PATH
    end
end

set fish_function_path $fish_function_path[1] "$HOME/dotfiles/fish_functions" $fish_function_path[2..-1]

set __fish_git_prompt_showcolorhints
set -g fish_prompt_pwd_dir_length 3

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

setenv LESS "-F -X -R"

if command -sq exa
    abbr -a -g l 'exa'
    abbr -a -g ls 'exa'
    abbr -a -g ll 'exa -l'
    abbr -a -g lll 'exa -la'
else
    abbr -a -g l 'ls'
    abbr -a -g ll 'ls -l'
    abbr -a -g lll 'ls -la'
end

if command -sq dircolors
    eval (dircolors -c "$HOME/dotfiles/dircolors")
end

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

if not functions -q wd
    fisher add fischerling/plugin-wd
end

if command -sq ssh-agent
    eval (ssh-agent -c) >/dev/null 2>&1
end
