# abbr --add hx helix
abbr --add ls eza -l
alias cat="bat --paging=never"
fish_add_path /home/desktop/.cargo/bin /usr/local/sbin /usr/local/bin /usr/bin /opt/android-sdk/platform-tools /var/lib/flatpak/exports/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl /home/desktop/.local/bin/ /home/desktop
set EDITOR helix
set fish_greeting

if status is-interactive
    starship init fish | source

    set -gx ATUIN_NOBIND true
    atuin init fish | source
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search

    zoxide init fish | source

    alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
end

function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
