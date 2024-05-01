if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";

set -gx RUBY_CONFIGURE_OPTS --with-openssl-dir=(brew --prefix openssl@1.1)
status --is-interactive; and rbenv init - fish | source

fish_add_path -gP "/opt/homebrew/bin" "/opt/homebrew/sbin";
! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

set -g theme_display_git_default_branch yes
set -g theme_date_format "+%F %H:%M"
