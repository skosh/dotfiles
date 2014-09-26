# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'

plugins=(git bundler ruby rails history rake)

export PATH="$HOME/.rbenv/bin:$PATH"

local spacer_colour="%{$fg[white]%}"

local dir='%{$fg[cyan]%}%3~'

local return='%(?.%{$fg[green]%}✔%{$reset_color%}.%{$fg[red]%}✗)'

local pre_prompt='%{$fg_bold[white]%}->%{$reset_color%}'

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

local rbenv='%{$fg[blue]%}[$(rbenv_version)]%{$reset_color%}'

local git='$(git_prompt_status) $(git_prompt_ahead) $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}◒ "

if [[ $USER == "root" ]]; then
  CARETCOLOR="red"
else
  CARETCOLOR="white"
fi

# alias

# deploy
function go() {
 ssh ubuntu@$* -i ~/.ssh/naharna-key.pem
}
function go1() {
 ssh ubuntu@$* -i ~/.ssh/ihjoz2-key
}
alias p='git push origin `git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`'
alias deploy='git push && gco production && git rebase master && git push origin production --force && cap deploy && gco master'
alias deploy1='git push && gco production && git rebase master && r assets:precompile && gaa && gca -m "Precompiled assets" && git push origin production --force && cap deploy && gco master'

# Command Enhancements
#ssh

alias iaas_panel='ssh deployer@cc.devnet.by'
alias billing_demo='ssh activebilling@my.active.by'

# Utility
alias reload='source ~/bin/dotfiles/bash/aliases'
alias ea='subl ~/bin/dotfiles/bash/aliases && reload' # Edit aliases
alias ee="subl ~/bin/dotfiles/bash/env"

# Quicker cd
function cr() {
 cd ~/Projects/$*
}

# Common -- Some are from Damian Conway
alias a='ls -A' # -A all except literal . ..
alias la="ls -A -l -G"
alias c='clear'
alias cdd='cd -'  # goto last dir cd'ed from
alias cl='clear; l'
function cdc() {
    cd $1; ls
}
alias cls='clear; ls'
alias h='history'
alias l.='ls -d .[^.]*'
alias l='ls -lhGt'  # -l long listing, most recent first
                    # -G color
alias lh="ls -lh"
alias ll='ls -lhG'  # -l long listing, human readable, no group info
alias lt='ls -lt' # sort with recently modified first
alias md='mkdir -p'
alias s='cd ..'   # up one dir
alias ceup='rm -rf ~/Projects/core/vendor/engines/cloud_express_plugin && cp -rf ~/Projects/cloud_express_plugin ~/Projects/core/vendor/engines'

alias e='exit'
alias k9="killall -9"
function killnamed () {
    ps ax | grep $1 | cut -d ' ' -f 2 | xargs kill
}

# Finder
alias o='open . &'

# Processes
alias tu='top -o cpu' # cpu
alias tm='top -o vsize' # memory

# Git
alias ungit="find . -name '.git' -exec rm -rf {} \;"
alias ga='git add'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit --amend'
alias gaa='git add .'
# Commit pending changes and quote all args as message
function gg() {
    git commit -v -a -m "$*"
}
alias gd='git diff'
alias gdm='git diff master'
alias gpr='g pull --rebase origin master'
alias gnp="git-notpushed"
alias gp='git push'
alias gst='git status'
alias gt='git status'
alias g='git'
alias glog='git log'
alias p='git push origin `git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`'
alias master='gco master'
alias prod='gco production'

alias eg='vim .git/config'
# Git clone from GitHub
function gch() {
  git clone git://github.com/$USER/$1.git
}

alias gb='git branch'
alias gba='git branch -a'
# Commit pending changes and quote all args as message
function gg() {
    git commit -v -a -m "$*"
}
alias gco='git checkout'
alias gd='git diff'
alias gdm='git diff master'
alias gl='git pull'
alias gnp="git-notpushed"
alias gp='git push'

# Git clone from GitHub
function gch() {
  git clone git://github.com/$USER/$1.git
}

# Ruby
alias r="rake"
alias rdd= 'r db:drop'
alias rdc= 'r db:create'
alias rdm= 'r db:migrate'
alias rds= 'r db:seed'
alias rdtp= 'r db:test:prepare'

alias redb='rdd && rdc && rdm && rds && rdtp'

alias reseed='rdd && rdc && rdm && rds'

# Rails
alias rc='rails console'
alias rs='rails server'

source $ZSH/oh-my-zsh.sh

source $HOME/.zshenv

PROMPT="${dir} ${return} ${pre_prompt} "
RPROMPT="${git} ${rbenv}"

unsetopt correct_all

export EDITOR=vim
