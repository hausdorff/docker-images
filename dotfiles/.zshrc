# Path to your oh-my-zsh installation.
export ZSH=/Users/alex/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



    function powerline_precmd() {
      export PS1="$(~/powerline-shell.py $? --shell zsh 2> /dev/null)"
    }

    function install_powerline_precmd() {
      for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
          return
        fi
      done
      precmd_functions+=(powerline_precmd)
    }

    install_powerline_precmd


# The next line enables bash completion for gcloud.
#source '/Users/alex/src/google-cloud-sdk/completion.zsh.inc'
# Custom zsh completions for gcloud
# NB compinit must be run after fpath is set
fpath=(/Users/alex/src/gcloud-zsh-completion/src $fpath)
autoload -U compinit compdef
compinit

export PATH=$PATH:~/.node/bin


PLAN9=/usr/local/plan9 export PLAN9
PATH=$PATH:$PLAN9/bin export PATH

export GOPATH=/Users/alex/src/go/
export PATH=$PATH:$GOPATH/bin


export PATH=/Users/alex/src/depot_tools:"$PATH"

alias gb="go build"
alias gr="go run"
alias gt="go test"
alias gta="go test ./..."
alias gg="go get"
alias gga="go get ./..."

alias h="cd ~/src/go/src/github.com/hausdorff"

# Add ccache to path
#export PATH="/usr/local/opt/ccache/libexec:$PATH"
export CXX=/usr/local/opt/ccache/libexec/g++
export CC=/usr/local/opt/ccache/libexec/gcc

# Joyent stuff.
export SDC_ACCOUNT=clemmer.alexander@gmail.com;
export SDC_KEY_ID=54:31:06:2a:6c:dd:65:98:a8:f4:a4:c3:a0:82:04:82;
export SDC_URL=https://us-east-1.api.joyentcloud.com;

# DC/OS vagrant config.
export DCOS_CONFIG_PATH=/Users/alex/src/mesos-demo/dcos-vagrant/etc/config-1.7.yaml
# path to the DCOS CLI binary
if [[ "$PATH" != *"/Users/alex/src/dcos/bin"* ]];
  then export PATH=$PATH:/Users/alex/src/dcos/bin;
fi

export RUST_SRC_PATH=/Users/alex/src/rustc-1.10.0/src/

export PATH=$PATH:/Users/alex/Library/Android/sdk/platform-tools/

export GTEST_SHUFFLE=1

source $HOME/.cargo/env

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/alex/Downloads/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/alex/Downloads/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/alex/Downloads/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/alex/Downloads/google-cloud-sdk/completion.zsh.inc'
fi

# Add .NET core to the path.
export PATH=$PATH:/usr/local/share/dotnet

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Pulumi shit.
export PATH=$PATH:/usr/local/pulumi/bin:/opt/pulumi/bin
export PULUMI_ACCESS_TOKEN=7b8aec61c267a4e7a839224231b919f81473b2f4

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
export PULUMI_ROOT=~/.pulumi

# added by travis gem
[ -f /Users/alex/.travis/travis.sh ] && source /Users/alex/.travis/travis.sh


alias p="pulumi"
export GOOGLE_CREDENTIALS=$(cat ~/.pulumi/gcp-credentials.json)


# Essentially log in as a different AWS user.
switch_to_role_account() {
        local environment=${1:-}

        local black=0;  local red=1;            local green=2; local yellow=3;
        local blue=4;   local magenta=5;        local cyan=6;   local white=7

        case "${environment}" in
        testing)
                environment_name=testing
                bg=$blue;fg=$white
                ;;
        staging)
                environment_name=staging
                bg=$yellow;fg=$black
                ;;
        production)
                environment_name=production
                bg=$red;fg=$white
                ;;
        *)
                echo $"Invalid environment specified: $0 { testing | staging | production }"
                return
        esac

        # export AWS_ACCESS_KEY_ID=${aws_key_id}
        # export AWS_SECRET_ACCESS_KEY=${aws_secret_key}

        export PULUMI_STACK_NAME_OVERRIDE="${environment_name}"
        export AWS_PROFILE="pulumi-${environment_name}"
        export AWS_DEFAULT_REGION=us-west-2
        export AWS_SDK_LOAD_CONFIG=1

        export PS1="\u:\w \\033[48;5;0;38;5;9m(${environment})\\033[0m $ "
        export PULUMI_STACK_NAME_OVERRIDE=${environment}

        tput setab $bg
        tput setaf $fg
        tput clear

        aws sts get-caller-identity
}

export DOCKER_REPO_PREFIX=hausdorff

# Kubernetes shit.
#k(){
#    docker run -it --rm \
#        -v "${HOME}:/root" \
#        ${DOCKER_REPO_PREFIX}/kubectl "$@"
#}
alias k=kubectl

export GITHUB_TOKEN=64228bf319439df7a44cf332ed2dd052e090b476

