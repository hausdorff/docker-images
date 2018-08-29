export DOCKER_REPO_PREFIX=hausdorff

# Git shit.
git() {
    docker run -ti --rm \
        -v "$(pwd):/git" \
        -v "$HOME/.ssh:/root/.ssh" \
        -v "$HOME/.gitconfig:/root/.gitconfig" \
        -v "$HOME/.gitignore:/root/.gitignore" \
        ${DOCKER_REPO_PREFIX}/git "$@"
}

# Kubernetes shit.
k(){
    docker run -it --rm \
        -v "${HOME}:/root" \
        ${DOCKER_REPO_PREFIX}/kubectl "$@"
}

# Vim shit.
vim() {
     docker run -it --rm \
        -v "/:/root-dir" \
        ${DOCKER_REPO_PREFIX}/vim "$@"
}

