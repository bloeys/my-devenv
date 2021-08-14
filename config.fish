set fish_greeting

if not ps -a | grep ssh-agent>/dev/null

  sleep (math (random 5 5000) / 2500)
  if not ps -a | grep ssh-agent>/dev/null
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID

    ssh-add ~/.ssh/id_rsa
  end
end

# Custom aliases
alias gcp='git commit -a; and git push'
alias gd='git diff'
alias gs='git status'
alias gobr='go build -o o.exe .; and ./o.exe; and rm ./o.exe'
alias python='python3'
