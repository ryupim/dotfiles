ZDOTDIR=$HOME/Work/dotfiles/.zsh
case ${OSTYPE} in
  darwin*)
    [ -f $ZDOTDIR/.zshrc_Mac ] && . $ZDOTDIR/.zshrc_Mac
    ;;
  linux*)
    [ -f $ZDOTDIR/.zshrc_Ubuntu ] && . $ZDOTDIR/.zshrc_Ubuntu
    ;;
esac