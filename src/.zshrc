# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/nana/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

#

# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract z zsh-syntax-highlighting zsh-autosuggestions)

#source oh-my-zsh for all the extras
source $ZSH/oh-my-zsh.sh

# custom aliases
alias gaddall="git add . && git commit -m $*"
alias add="git add $*"
alias comm="git commit -m $*"
alias start-env"source ./{$*}/bin/activate"
alias rezsh="source ~/.zshrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# CUSTOM FUNCTIONS
#
# edit zsh and reload shell to update changes 
editZsh() {
  vim ~/.zshrc
  source ~/.zshrc
}

# copy zsh config file to repo, commit with argument and push to github
commitZsh() {
  source ~/.zshrc
  cp ~/.zshrc ~/dotfiles/src 
  cd ~/dotfiles
  git add .
  git commit -m $1
  git push
}

updateDotRepo() {
  cp ~/.zshrc ~/.config/dotfiles/src
  cp ~/.p10k.zsh ~/.config/dotfiles/src
  cp ~/.profile ~/.config/dotfiles/src
  cd ~/.config/dotfiles
  git add . 
  git commit -m $1
  git push
  cd ~
}
