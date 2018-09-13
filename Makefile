LNS := ln -s

all: git kubectl vim

firefox:
	docker build -t hausdorff/firefox firefox

git:
	docker build -t hausdorff/git git

kubectl:
	docker build -t hausdorff/kubectl kubectl

vim:
	docker build -t hausdorff/vim vim

install:
	$(LNS) "${PWD}/dotfiles/.gitconfig" ~/.gitconfig
	$(LNS) "${PWD}/dotfiles/.gitignore_global" ~/.gitignore_global
	$(LNS) "${PWD}/dotfiles/.vimrc" ~/.vimrc
	$(LNS) "${PWD}/dotfiles/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json
	$(LNS) "${PWD}/dotfiles/vscode/keybindings.json" ~/Library/Application\ Support/Code/User/keybindings.json


.PHONY: all firefox git kubectl vim install

