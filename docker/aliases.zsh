#!/bin/zsh
if which docker >/dev/null 2>&1; then
  dcleanup() {
    # shellcheck disable=SC2046
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    # shellcheck disable=SC2046
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
  }

  docker() {
    if [ "$1" = "cleanup" ]; then
      dcleanup
    else
      command docker "$@"
    fi
  }
  alias dkr='docker'
fi

function gemini {
    local tty_args=""
    if [ -t 0 ]; then
        tty_args="--tty"
    fi

    podman run -i ${tty_args} --rm --userns=keep-id \
        -v "$(pwd):/home/gemini/workspace:Z" \
        -v "$HOME/.gemini:/home/gemini/.gemini:Z" \
        -e DEFAULT_UID=$(id -u) \
        -e DEFAULT_GID=$(id -g) \
        mmoerz/gemini-cli "$@"
}
