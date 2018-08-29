export DOCKER_REPO_PREFIX=hausdorff

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
