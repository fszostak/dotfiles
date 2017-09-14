# spinner
revolver --style 'simpleDots' start

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
  rupa/z
  git
  git-extras
  git-flow-avh
  laravel
  laravel5
  composer
  heroku
  # npm
  node
  meteor
  command-not-found
  supercrabtree/k
  zsh-users/zsh-autosuggestions
  history-substring-search
  zsh-users/zsh-syntax-highlighting
  desyncr/vagrant-zsh-completion
  felixr/docker-zsh-completion
  git-flow
  ubuntu
  djui/alias-tips
  colorize
  emoji
  sublime
  web-search
  tonietto/show-version
  tonietto/aliases
  $HOME/aliases
  $HOME/tiny-care-terminal
EOBUNDLES

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme fwalch
antigen bundle tonietto/purity

# Tell antigen that you're done.
antigen apply

# Config default
export EDITOR='vim'
export BROWSER='chromium'

# User configuration
export PATH="/usr/local/heroku/bin:/Library/Frameworks/Python.framework/Versions/3.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/bin:/usr/games:`yarn global bin`"

# nodengine and show-version
cd () { builtin cd "$@" && chpwd; }
pushd () { builtin pushd "$@" && chpwd; }
popd () { builtin popd "$@" && chpwd; }

chpwd () {
  local PKG

  PKG=$PWD/package.json
  if [ -f "$PKG" ] && [ "$NODENGINE_LAST_DIR" != "$PWD" ]; then
    nodengine
    show-version
    printf "\033[36m%s\033[0m \033[90m%s\033[0m\n" "nodengine" "$(node --version)"
    NODENGINE_LAST_DIR=$PWD
  fi
}

# gitignore.io
function gi() { curl -L -s https://www.gitignore.io/api/$@ ; }

# fix term variable type not accepted in ssh servers
export TERM=xterm-256color

# keychain
if [ -f ".keychain.sh" ]; then
  source .keychain.sh
else echo "no keychain config found"
fi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# spinner
revolver stop
