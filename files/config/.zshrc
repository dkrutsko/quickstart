# Enable Powerlevel10k instant prompt. Should stay close to the top of this file.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Select plugins which need to be loaded
plugins=(git brew history kubectl zsh-syntax-highlighting)

# Reload the oh-my-zsh config
source "${ZSH}/oh-my-zsh.sh"

# Make sure that UTF-8 is set
export LANG="en_US.UTF-8"

# Set the preferred editor
export EDITOR="vim"

# To customize prompt, run `p10k configure` or edit ${HOME}/.p10k.zsh
[[ ! -f "${HOME}/.p10k.zsh" ]] || source "${HOME}/.p10k.zsh"

##----------------------------------------------------------------------------##

# Big ZSH command history
export HISTSIZE="10000000"
export SAVEHIST="10000000"
export SAVEHIST="${HISTSIZE}"

setopt INC_APPEND_HISTORY			# Write to the history file immediately, not when the shell exits
#setopt SHARE_HISTORY				# Share history between all sessions
#setopt HIST_EXPIRE_DUPS_FIRST		# Expire duplicate entries first when trimming history
#setopt HIST_IGNORE_DUPS			# Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS			# Delete old recorded entry if new entry is a duplicate
#setopt HIST_FIND_NO_DUPS			# Do not display a line previously found
setopt HIST_IGNORE_SPACE			# Don't record an entry starting with a space
#setopt HIST_SAVE_NO_DUPS			# Don't write duplicate entries in the history file
#setopt HIST_REDUCE_BLANKS			# Remove superfluous blanks before recording entry
#setopt HIST_VERIFY					# Don't execute immediately upon history expansion
#setopt HIST_BEEP					# Beep when accessing nonexistent history

##----------------------------------------------------------------------------##

# Limit Homebrew updates to once weekly
export HOMEBREW_AUTO_UPDATE_SECS="604800"

##----------------------------------------------------------------------------##

# Reload all environment files
alias reload-env="source /etc/profile && source ~/.zshrc"

# Disable auto pagers
export PAGER=
export BAT_PAGER=

# Make tabs four spaces
export LESS="--tabs=4"
tabs -4 &> /dev/null

##----------------------------------------------------------------------------##

# Expose brew command
eval "$(/opt/homebrew/bin/brew shellenv)"

# Use brew applications
export PATH="/opt/homebrew/opt/curl/bin:${PATH}"

##----------------------------------------------------------------------------##

# Check if nvm has been installed
if brew list nvm &> /dev/null; then

	# Export NVM directory
	export NVM_DIR="/opt/homebrew/opt/nvm"

	# Load NVM application
	source "${NVM_DIR}/nvm.sh"

	# Load NVM completions
	source "${NVM_DIR}/etc/bash_completion.d/nvm"

fi

##----------------------------------------------------------------------------##

# Check if pyenv has been installed
if brew list pyenv &> /dev/null; then

	# Export primary pyenv directory
	export PYENV_ROOT="${HOME}/.pyenv"

	# Add pyenv binaries to the path
	export PATH="${PYENV_ROOT}/bin:${HOME}/.local/bin:${PATH}"

	# Fully load pyenv into profile
	eval "$(pyenv            init --path)"
	eval "$(pyenv            init -     )"
	eval "$(pyenv virtualenv-init -     )"

fi

##----------------------------------------------------------------------------##

# Run any additional configuration
if [[ -d "${HOME}/.zshrc.d" ]]; then

	for sh in "${HOME}/.zshrc.d/"*.sh; do
		if [[ -r "$sh" ]]; then
			source "$sh"
		fi
	done

	unset sh

fi

##----------------------------------------------------------------------------##
