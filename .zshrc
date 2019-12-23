case $TTY in
*tty*)
	export GPG_TTY="$TTY"
	;;
esac

#export RUSTC_WRAPPER="$HOME/.cargo/bin/sccache"
export TERM="xterm-256color"
export KEYTIMEOUT=1
export PATH="/usr/lib/ccache/bin/:/usr/lib/jvm/java-8-openjdk/jre/bin/:$HOME/.cargo/bin:$HOME/utils:$PATH" # $(ruby -e 'puts Gem.user_dir')/bin
export SUDO_EDITOR=nvim
export XDG_RUNTIME_DIR=/run/user/`id -u`
export LANG=en_CA.UTF-8
export EDITOR='/bin/nvim'
export VISUAL="$EDITOR"
export TERMINAL='xfce4-terminal'
export BROWSER='firefox-nightly'
export DEFAULT_USER=gentz
export CARGO_INCREMENTAL=1
export DISTCC_DIR=/tmp/distcc

case $0 in
*zsh)
	fpath+=$HOME/.zfunc

	# Path to your oh-my-zsh installation.
	ZSH=$HOME/zshinstall/oh-my-zsh

	P9K_MODE='nerdfont-complete'
    ZSH_THEME="powerlevel9k/powerlevel9k"
    plugins=(zsh-autosuggestions)

	# Uncomment the following line to use case-sensitive completion.
	CASE_SENSITIVE="true"

	# Uncomment the following line to use hyphen-insensitive completion. Case
	# sensitive completion must be off. _ and - will be interchangeable.
	# HYPHEN_INSENSITIVE="true"

	# Uncomment the following line to disable bi-weekly auto-update checks.
	DISABLE_AUTO_UPDATE="true"

	# Uncomment the following line to enable command auto-correction.
	ENABLE_CORRECTION="true"

	# Uncomment the following line to display red dots whilst waiting for completion.
	COMPLETION_WAITING_DOTS="true"

	# Uncomment the following line if you want to disable marking untracked files
	# under VCS as dirty. This makes repository status check for large repositories
	# much, much faster.
	# DISABLE_UNTRACKED_FILES_DIRTY="true"

	# Uncomment the following line if you want to change the command execution time
	# stamp shown in the history command output.
	# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
	HIST_STAMPS="yyyy-mm-dd"

	ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
	if [[ ! -d $ZSH_CACHE_DIR ]]; then
		mkdir $ZSH_CACHE_DIR
	fi
    
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_USE_ASYNC=true
    ZSH_AUTOSUGGEST_MANUAL_REBIND=true
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50

	#bindkey -v
	autoload -U colors && colors

	P9K_LEFT_PROMPT_ELEMENTS=(context dir)
	P9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time ssh disk_usage background_jobs)

    P9K_DIR_SHOW_WRITABLE=true
    P9K_DIR_NOT_WRITABLE_FOREGROUND='yellow'
    P9K_DIR_NOT_WRITABLE_BACKGROUND='red'
    P9K_DIR_NOT_WRITABLE_ICON_COLOR='yellow'

    P9K_CONTEXT_ALWAYS_SHOW=false

	P9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
	P9K_COMMAND_EXECUTION_TIME_PRECISION=5

    P9K_DIR_SHORTEN_LENGTH=2
	P9K_DIR_SHORTEN_STRATEGY=truncate_middle

	P9K_DISK_USAGE_WARNING_LEVEL=80
	P9K_DISK_USAGE_CRITICAL_LEVEL=90

    P9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON=""
	P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON="%K{004}%F{000} %D{ %H:%M  %d.%m.%y} %f%k%F{004} %f"
	P9K_PROMPT_ON_NEWLINE=true
	P9K_PROMPT_ADD_NEWLINE=true

	P9K_CONTEXT_DEFAULT_FOREGROUND='000'
	P9K_CONTEXT_ROOT_FOREGROUND='003'

	P9K_CONTEXT_DEFAULT_BACKGROUND='004'
	P9K_CONTEXT_ROOT_BACKGROUND='001'

	P9K_DIR_DEFAULT_BACKGROUND='003'
	P9K_DIR_DEFAULT_FOREGROUND='052'

	P9K_DIR_HOME_BACKGROUND='011'
	P9K_DIR_HOME_SUBFOLDER_BACKGROUND='011'

	P9K_RAM_BACKGROUND="002"

	P9K_LOAD_NORMAL_BACKGROUND="002"
	P9K_LOAD_WARNING_BACKGROUND="003"
	P9K_LOAD_CRITICAL_BACKGROUND="001"

	P9K_LOAD_NORMAL_FOREGROUND="000"
	P9K_LOAD_WARNING_FOREGROUND="001"
	P9K_LOAD_CRITICAL_FOREGROUND="003"

	P9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="000"
	P9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="001"
	P9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="003"

	P9K_DISK_USAGE_NORMAL_BACKGROUND="002"
	P9K_DISK_USAGE_WARNING_BACKGROUND="003"
	P9K_DISK_USAGE_CRITICAL_BACKGROUND="001"

	P9K_DISK_USAGE_NORMAL_FOREGROUND="000"
	P9K_DISK_USAGE_WARNING_FOREGROUND="001"
	P9K_DISK_USAGE_CRITICAL_FOREGROUND="003"

	P9K_CONTEXT_TEMPLATE="%n@%m"

    # OPAM configuration
    # . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
    setopt extendedglob
	source $ZSH/oh-my-zsh.sh
	;;
esac

alias top='htop'
alias hyperrogue='hyperrogue -m /usr/share/hyperrogue/hyperrogue-music.txt'

#[[ -f $HOME/Documents/emsdk/emsdk_env.sh ]] && source $HOME/Documents/emsdk/emsdk_env.sh > /dev/null

function zsh_profile() {
    source ~/utils/profile_inner
}

# set type of SECONDS to float to increase precision
typeset -F SECONDS 

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")" > /dev/null
fi
