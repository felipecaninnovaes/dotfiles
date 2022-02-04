export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel9k/powerlevel9k"


plugins=(
    git
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
    zsh-syntax-highlighting

)

source $ZSH/oh-my-zsh.sh

if [[ ! -f $HOME/.oh-my-zsh/custom/plugins/zsh-completions/README.md ]]; then
    command git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
fi


if [[ ! -f $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/README.md ]]; then
    command git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi


if [[ ! -f $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/README.md ]]; then
    command git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi


if [[ ! -f $HOME/.oh-my-zsh/custom/themes/powerlevel9k/README.md ]]; then
    command git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi


if [[ ! -f $HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search/README.md ]]; then
    command git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
fi

if [[ ! -f $HOME/fonts/install.sh ]]; then
    command git clone https://github.com/powerline/fonts.git; cd fonts; ./install.sh; cd;
fi

