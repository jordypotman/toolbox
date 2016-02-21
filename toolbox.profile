# .profile settings for toolbox. Intended to be sourced from ~/.profile .

# Add $HOME/toolbox/bin to the front of $PATH if it exists and $PATH does not
# already contain $HOME/toolbox/bin .
if [ -d "$HOME/toolbox/bin" ]; then
  case ":$PATH:" in
    *:$HOME/toolbox/bin:*) ;;
    *) export PATH=$HOME/toolbox/bin:$PATH ;;
  esac
fi
