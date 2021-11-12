set fish_greeting

if not ps -a | grep ssh-agent>/dev/null

  if not test -e /cygdrive/c/Users/user/.config/fish/myFishConfigLock
    touch /cygdrive/c/Users/user/.config/fish/myFishConfigLock

    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID

    ssh-add ~/.ssh/id_rsa
    ssh-add ~/.ssh/*.key

    rm /cygdrive/c/Users/user/.config/fish/myFishConfigLock
  end
end

# Custom aliases
alias gcp='git commit -a; and git push'
alias gd='git diff'
alias gs='git status'
alias gobr='go build -o o.exe .; and ./o.exe; and rm ./o.exe'
alias ll='ls -al'
alias got='gotest -count=1 ./...'
alias python='/cygdrive/c/Users/user/AppData/Local/Programs/Python/Python37/python.exe'
alias python3='/cygdrive/c/Users/user/AppData/Local/Programs/Python/Python37/python.exe'
alias swig='/cygdrive/d/Program\ Files/swigwin-4.0.2/swig.exe'
