# Optional, per-system. Source global definitions
# if [ -f /etc/bashrc ]; then
#         . /etc/bashrc
# fi

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# force commands to be appended to history *now*, rather than after shell exits
# PROMPT_COMMAND='history -a'

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PROMPT_DIRTRIM=2

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# umask
umask 2

# nice options for 'less'
export LESS="-g -i -M -w -x4 -R"
export EDITOR=vim
eval "$(dircolors -b ${HOME}/.dircolors)"
export DISPLAY=localhost:0.0

# bash git prompt
GIT_PROMPT_THEME=Solarized_Ubuntu
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_SHOW_UPSTREAM=1
GIT_PROMPT_SHOW_UNTRACKED_FILES=no
#GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh
export PS1="\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ "
source ~/.bash-git-prompt/gitprompt.sh

#export TERM=xterm-256color

# shoehorn non-su completion on Cent
#. ~/.config/bash-completion/profile.d/bash_completion.sh

export NVM_DIR="/home/quaestor/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH=$PATH:$(/mnt/c/Windows/System32/cmd.exe /c call echo %PATH% | sed -e 's.\\./.g;s.\([ABC]\):.\/mnt\/\L\1\E.g;s.;.:.g;s.system32.System32.Ig;s.WINDOWS.Windows.Ig')
alias config='/usr/bin/git --git-dir=/home/quaestor/.cfg/ --work-tree=/home/quaestor'
