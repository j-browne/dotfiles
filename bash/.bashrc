#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[0m\]\n$ "
PS2='> '
PS3='> '
PS4='+ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# env variables
export HISTSIZE=10000
export HISTFILESIZE=50000
export HISTCONTROL=ignoreboth
export EDITOR='nvim'
export PATH=$HOME/bin:${PATH}
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:'/usr/lib/pkgconfig/'

# aliases
alias sudo='sudo '
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias less='less -R'
alias yaourt='yaourt'
alias xclip='xclip -selection clipboard'
alias dia='dia --integrated'
alias minecraft='java -jar ~/.minecraft/Minecraft.jar'
alias bc='bc -q'
alias R='R --quiet --no-save'
alias root='root -l'
alias nv='nvim'
alias vim='nvim'

source ~/.profile

export PYTHONPATH="${HOME}/lib/:${PYTHONPATH}"
