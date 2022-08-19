# Workaround Pycharm check is resolved https://youtrack.jetbrains.com/issue/IDEA-176888
[[ "$PATH" =~ /usr/local/bin ]] || export PATH=$PATH:/usr/local/bin

# Custom PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/Users/waxo/develop/flutter/bin
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# Path to your oh-my-zsh installation.
export ZSH="/Users/waxo/.oh-my-zsh"

alias tfwdev="tf workspace select dev"
alias tfwprod="tf workspace select default"
alias tfpdev="tfwdev && tfp -var-file=dev.tfvars"
alias tfadev="tfwdev && tfa -var-file=dev.tfvars"
alias tfpprod="tfwprod && tfp -var-file=prod.tfvars"
alias tfaprod="tfwprod && tfa -var-file=prod.tfvars"

alias gwax="ga . && gcn! && ggpush --force"
alias gupdate="gco main && ggpull && gco develop && ggpull && gfa"
alias gclbranch="git branch -l --no-color | grep -v 'develop\|main' | xargs git branch -D"

alias avekia_env="source /Users/waxo/AvekiaProjects/avekia/bin/activate"

alias ghmerge="gh pr merge --auto --delete-branch"

cheh() {
  str='gh pr create'
  for reviewer in $@
  do
    str="$str --reviewer $reviewer"
  done
  eval $str
}

gmain () {
  git checkout main
  git pull origin "$(git_current_branch)"
  git checkout develop
  git pull origin "$(git_current_branch)"
  git fetch --all --prune
  git checkout -b deploy-main/$1
  git rebase main
  git push origin "$(git_current_branch)"
  gh pr create --base main
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
  git
  gitfast
  flutter
  node
  gulp
  yarn
  docker
  docker-compose
  pip
  python
  terraform
  virtualenv
)
RPROMPT='$(tf_prompt_info)'

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

# nvm

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

