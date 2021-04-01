set fish_greeting

if not ps -a | grep ssh-agent>/dev/null
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID

  ssh-add ~/.ssh/id_rsa
end
