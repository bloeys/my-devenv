set fish_greeting

if not ps -a | grep ssh-agent>/dev/null

  set lockFile '/cygdrive/c/Users/user/.config/fish/myFishConfigLock'
  if not test -e $lockFile

    echo $fish_pid > $lockFile
    sleep 0.25

    set lockPID (head $lockFile)
    if test $lockPID = $fish_pid

        eval (ssh-agent -c)
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID

        ssh-add ~/.ssh/id_rsa
        ssh-add ~/.ssh/*.key

        rm $lockFile
     end
  end
end

# Custom aliases

function gobr --description 'alias gobr=go build -o o.exe .; and ./o.exe $argv; rm ./o.exe'
    go build -o o.exe .
    if test $status = "0"
        ./o.exe $argv
        rm ./o.exe
    end
end

alias gcp='git commit -a; and git push'
alias gd='git diff'
alias gs='git status'
alias ll='ls -alh'
alias got='gotest -count=1 ./...'
alias python='/cygdrive/c/Users/user/AppData/Local/Programs/Python/Python37/python.exe'
alias python3='/cygdrive/c/Users/user/AppData/Local/Programs/Python/Python37/python.exe'
alias swig='/cygdrive/d/Program\ Files/swigwin-4.0.2/swig.exe'
