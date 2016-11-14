# Functions
runNtimes () {
    errs=0
    err_file="err-$errs.out"
    for run in {1..$1}
    do
        (eval $2) &> $err_file
        test $? -gt 0 && errs=$(($errs+1))
        echo $errs
        err_file="err-$errs.out"
    done
    echo --- RESULT ----
    echo Errors: $errs
}

# kill by grep
pgkl () { 
    ps aux| grep "$1" | tr -s ' '| cut -f 2 -d ' '| xargs -I '{}' kill -9 {}
}

# TEMP
local_config="$HOME/.aliases_local.sh"
if [ -f "$local_config" ]
then
    echo Loading local config $local_config
    source $local_config
fi

alias ipy="ipython3"
alias py="python3"

SCRIPT=`realpath $0`
alias vsnip="cd ~/.vim/bundle/vim-snippets/UltiSnips/; vim"

alias chkals="pygmentize -g $SCRIPT|grep "
alias s="sudo"

alias wh="which"

alias df="df -h"
alias du="du -h"

alias clrpac="sudo rm -f /var/lib/pacman/sync/* && sudo yaourt -Syu"

alias h="history | grep "
alias g="grep $1"
alias pg="ps aux| grep $1"

alias gbd="grunt build:dist"
alias gse="grunt serve"
alias gte="grunt test"

alias jht="jshint ."
alias v="vim"

#########
#  Git  #
#########
alias gi="git init"
alias gs="git status"
alias gsu="git status -uno"
alias gst="git stash"
alias gsta="git stash apply"
alias gd="git diff"
alias gdo="git diff origin/$1"
alias gdh="git diff HEAD"
alias gc="git clone $1 $2"
alias gcm="git commit -m "$1""
alias gaA="git add -A ."
alias gaa="git add $1"
alias ga="git add -u $1" #only update
alias gp="git pull"
alias gpr="git pull --rebase"
alias gpu="git push"
alias gpur='`gpu 2>&1 |tail -n2`' #some magic
alias gpo="git push origin $1"
alias gca="git commit --amend"
alias gdp="git diff master@{1} master"

alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glm="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit origin/master..HEAD"
alias glp="gl -p" # show diffs
alias glg1="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias glg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias glo="git log --oneline"

alias grhh="git reset --hard HEAD"
alias gcp="git cherry-pick $1"

alias gcoc="gco stash@{0} -- src/rest/scripts/config.js"

alias gb="git branch"
alias gbD="git branch -D"
alias gbcllm="git branch --merged | grep -v '\*\|master\|develop' | xargs -n 1 git branch -d" #clean local -> merged

alias gco="git checkout"
alias gcob="git checkout -b"
alias grs="git reset --soft"
alias grsp="git reset --soft HEAD^"
alias grh="git reset --hard"
alias grhH="git reset --hard HEAD"

alias gme="git merge"
alias gmes="git merge --squash"

alias grb="git rebase"
alias grbi="git rebase -i"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"
alias h10="HEAD~10"


# npm
alias ni="npm install";
alias nis="npm i -S "
alias nid="npm i -D "
alias nig="npm i -g "
alias nr="npm run $1";
alias nrs="npm run start";
alias nrb="npm run build";
alias nrt="npm run test";
alias nrc="npm run commit";

# Clipboard
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# Arch
alias ya="yaourt  --nameonly --pager --color --noconfirm $1"

# Files
alias l="ls -o -hX --group-directories-first"
alias la="ls -o -AhX --group-directories-first"
alias j="jump"
alias v='vim'

# Config
alias termiteconf="vim ~/.config/termite/config"
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias vinit="cd ~/Code/dotfiles/.config/vim && v init.vim"
alias i3conf="vim ~/.i3/config"
alias tmuxconf="vim ~/.tmux.conf"
alias xres="vim ~/.Xresources && xrdb ~/.Xresources"
alias vrc="vim ~/.vimrc"
alias als="vim $SCRIPT && source ~/.zshrc"

alias update.="cd $CONFIG_HOME && gaa -u && gcm 'Update dotfiles' && gpo master"

# Man
#alias h='tldr'
# Useful commands
# fuser - find process on port (fuser 8080/tcp)
