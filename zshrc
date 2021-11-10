# Workaround Pycharm check is resolved https://youtrack.jetbrains.com/issue/IDEA-176888
[[ "$PATH" =~ /usr/local/bin ]] || export PATH=$PATH:/usr/local/bin

# Custom PATH
export PATH=$PATH:/usr/local/sbin
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# Path to your oh-my-zsh installation.
export ZSH="/Users/waxo/.oh-my-zsh"

alias python="python3"
alias gwax="ga . && gcmsg f && grbi HEAD~2 && ggpush --force"
alias gupdate="gco master && ggpull && gco staging && ggpull && gco develop && ggpull && gfa"

gstag () {
  git checkout staging
  git pull origin "$(git_current_branch)"
  git checkout develop
  git pull origin "$(git_current_branch)"
  git fetch --all --prune
  git checkout -b deploy-staging/$1
  git rebase staging
  git push origin "$(git_current_branch)"
}

gmast () {
  git checkout master
  git pull origin "$(git_current_branch)"
  git checkout staging
  git pull origin "$(git_current_branch)"
  git fetch --all --prune
  git checkout -b deploy-master/$1
  git rebase master
  git push origin "$(git_current_branch)"
}


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="waxo"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  gh
  git
  gitfast
  ember-cli
  bower
  node
  npm
  gulp
  yarn
  thefuck
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

# User configuration

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval $(thefuck --alias)


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/waxo/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/waxo/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/waxo/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/waxo/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/waxo/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/waxo/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh
# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/waxo/WebstormProjects/ln23/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/waxo/WebstormProjects/ln23/node_modules/tabtab/.completions/electron-forge.zsh

# added by travis gem
[ -f /Users/waxo/.travis/travis.sh ] && source /Users/waxo/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/waxo/Downloads/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/waxo/Downloads/tmp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/waxo/Downloads/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/waxo/Downloads/tmp/google-cloud-sdk/completion.zsh.inc'; fi
