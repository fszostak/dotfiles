# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
  colorize
  command-not-found
  djui/alias-tips
  docker
  emoji
  git
  git-extras
  git-flow
  git-flow-avh
  heroku
  history-substring-search
  node
  supercrabtree/k
  tonietto/aliases
  tonietto/show-version
  tonietto/show-node
  webyneter/docker-aliases.git
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  $HOME/aliases
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
export BROWSER='qutebrowser'

# User configuration
export PATH="/home/gustavo/.gem/ruby/2.5.0/bin:/usr/local/heroku/bin:/Library/Frameworks/Python.framework/Versions/3.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/bin:/usr/games:`yarn global bin`"

# nodengine and show-version
cd () { builtin cd "$@" && chpwd; }
pushd () { builtin pushd "$@" && chpwd; }
popd () { builtin popd "$@" && chpwd; }

chpwd () {
  local PKG

  PKG=$PWD/package.json
  if [ -f "$PKG" ] && [ "$NODE_LAST_DIR" != "$PWD" ]; then
    show-version
    show-node
    NODE_LAST_DIR=$PWD
  fi
}

# gitignore.io
function gi() { curl -L -s https://www.gitignore.io/api/$@ ; }

# fix term variable type not accepted in ssh servers
export TERM=xterm-256color

# keychain
function kiss(){
  source ~/.keychain.sh 
}

# vi controls in command line
set -o vi
set noerrorbells
set showmatch
set matchtime=8
set tabstop=2
set shiftwidth=2
set nowrapscan
set ignorecase
set autoindent
set cindent

bindkey -M vicmd v edit-command-line


# added by nvm
source /usr/share/nvm/init-nvm.sh

# added by travis gem
[ -f /home/gustavo/.travis/travis.sh ] && source /home/gustavo/.travis/travis.sh

# fasd
eval "$(fasd --init auto)"
