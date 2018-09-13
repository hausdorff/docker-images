export DOCKER_REPO_PREFIX=hausdorff

# Git shit.
function git
    docker run -ti --rm \
        -v "$PWD:/git" \
        -v "$HOME/.ssh:/root/.ssh" \
        -v "$HOME/.gitconfig:/root/.gitconfig" \
        -v "$HOME/.gitignore:/root/.gitignore" \
        $DOCKER_REPO_PREFIX/git $argv
end

# Kubernetes shit.
function k
    docker run -it --rm \
        -v "$HOME:/root" \
        $DOCKER_REPO_PREFIX/kubectl $argv
end

# # Vim shit.
# function vim
#     docker run -it --rm \
#         -v "$PWD:/vim" \
#         $DOCKER_REPO_PREFIX/vim $argv
# end
