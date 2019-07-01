#!/bin/bash
# Default editor
export EDITOR=/usr/bin/vim

# Save each command to .bash_history immediately, rather than at end of each session
# This works around the "last bash session clobbers any previous history" behavior.
PROMPT_COMMAND='history -a'

# git branch for prompt
if [ -f $(brew --prefix)/bash_completion.d/git-prompt.sh ]; then
    . $(brew --prefix)/bash_completion.d/git-prompt.sh
elif [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi
if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
   BRANCH="\$(__git_ps1 '[ %s ] ')"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31'
export CLICOLOR=1

if [[ "$OSTYPE" =~ darwin ]]; then
    if $(type source-highlight>/dev/null 2>&1) ; then
        export LESS="-RX"
        export LESSOPEN="| /opt/local/bin/src-hilite-lesspipe.sh %s"
    fi
elif [[ "$OSTYPE" =~ linux ]]; then
    if $(type source-highlight>/dev/null 2>&1) ; then
        export LESS="-RX"
        export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
    fi
fi

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/local/opt/go/libexec/bin:$PATH
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export HISTCONTROL="erasedups"
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend
shopt -s cdspell
shopt -s cmdhist

export PS1="\[\033[01;32m\]\u@\h\[\033[00;34m\] \w \[\033[0;31m\]${BRANCH}\[\033[00;34m\]\n\$\[\033[00m\] "

# AWS CLI bash completion
complete -C aws_completer aws

# Set GOPATH
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# https://github.com/github/hub
eval "$(hub alias -s)"

complete -C /usr/local/bin/vault vault

# :thisisfine:
alias ansible-playbook='OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES ansible-playbook'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Remap CTRL-T back to transpose-chars
bind '"\C-t": transpose-chars'
