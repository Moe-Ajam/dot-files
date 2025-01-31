# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Initialize powerlevel10k
source /home/linuxbrew/.linuxbrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Initialize Starship
eval "$(starship init zsh)"

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first

setopt hist_ignore_dups
setopt hist_verify

# Completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Handle different OS paths
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

  export JAVA_HOME="/home/linuxbrew/.linuxbrew/opt/openjdk"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
  # export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home/"
  export JAVA_HOME="$(brew --prefix openjdk)"
  export PATH="$JAVA_HOME/bin:$PATH"
fi

# Zoxide (better cd)
eval "$(zoxide init zsh)"

# alias cd="z"

export PATH=$HOME/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# Aliases
alias vim=nvim

# Obsidian
alias oo='cd $HOME/Documents/Personal'
alias or='vim $HOME/Documents/Personal/1_Inbox/*.md'


if [[ "$OSTYPE" == "darwin"* ]]; then
  alias 'cd C'= 'cd /mnt/c/'
fi
