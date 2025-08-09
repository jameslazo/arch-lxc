# basic bashrc for dev servers
alias ll='ls -hAlF'
alias lt='ls -thAlF'
alias la='ls -Ah'
alias ta='tmux attach -t $HOSTNAME &> /dev/null || tmux new -s $HOSTNAME'

export EDITOR=/usr/bin/vim
export UTF=en_US.UTF-8
export LANG=$UTF
export LANGUAGE=$UTF
export LC_CTYPE=$UTF
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=$HOME/.cache

shopt -s globstar
shopt -s autocd
shopt -s histappend

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=20000
HISTFILIESIZE=200000
HISTTIMEFORMAT='%F %T '

PROMPT_COMMAND='history -a; history -n'

mkcd() {
  mkdir -p $1
  cd $1
}

extract() {
  if [ ! -f "$1" ] ; then
    echo "'$1' does not exist."
    return 1
  fi

  case "$1" in
    *.tar.bz2)                tar xvjf "$1"   ;;
    *.tar.xz)                 tar xvJf "$1"   ;;
    *.tar.gz)                 tar xvzf "$1"   ;;
    *.bz2)                    bunzip2 "$1"    ;;
    *.rar)                    rar x "$1"      ;;
    *.gz)                     gunzip "$1"     ;;
    *.tar)                    tar xvf "$1"    ;;
    *.tbz2)                   tar xvjf "$1"   ;;
    *.tgz)                    tar xvzf "$1"   ;;
    *.zip)                    unzip "$1"      ;;
    *.Z)                      uncompress "$1" ;;
    *.xz)                     xz -d "$1"      ;;
    *.7z)                     7z x "$1"       ;;
    *.a)                      ar x "$1"       ;;
    *.lzh | *.lzs | *.pma)    lha -x "$1"     ;;
    *)          echo "Unable to extract '$1'" ;;
  esac
}

slog() {
  log=$HOME/slog.md
  today="# $(date '+%Y-%m-%d')"
  entry=$(head -n 1 $log)
  [ "$today" != "$entry" ] && echo -e "$today\n## Tasks\n- \n\n## Resources\n- []()\n\n$(cat $log)" > $log && vim $log || nvim $log
}

