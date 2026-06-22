default:
    just --list

# run the docker file
start:
    docker compose up --build --remove-orphans

tmux:
    tmux new -t docker

# purge all the docker containers
clear:
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    docker rmi $(docker images -q)

# Check whether template and environment are all right
validate:
    docker compose config


alias s := start
alias c := clear
alias t := tmux
alias v := validate