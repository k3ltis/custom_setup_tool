# Custom Setup Tool

Tool to install ohmyzsh, homebrew, homebrew formulas, and other handy tools on a (fresh) unix instance.
While this tool is specific for my needs and personal preference it might be useful as inspiration on how to setup your own tool.

## Motivation
The time spent on installing the same CLI tools in fresh environments over and over again is _too damn high_.
I need to to this frequently and it simply cumbersome and error-prone.
Also automation is key.

## Tools and configuration covered
* [x] Oh-my-zsh
* [x] Homebrew
* [x] homebrew formulas
  * fzf
  * tldr
  * stow
  * tmux
  * the_silver_searcher
  * glances
  * yq
  * fx
  * coreutils
  * tree
  * fd
  * dive
  * k9s
  * lazydocker
  * ctop
  * neovim
  * podman
* [x] Podman 
* [x] fzf keybindings (`$(brew --prefix)/opt/fzf/install`)
* [ ] vscode configuration
* [ ] symlink optimization with stow
* [x] Golang

# Usage

To execute the playbook against localhost you have to first install ansible, then the ansible requirements and finally run the playbook.

```shell
# Install ansible and re-login shell
sudo apt update && sudo apt install pipx && pipx ensurepath && pipx install --include-deps ansible

# Clone repo
git clone git@github.com:k3ltis/custom_setup_tool.git && cd custom_setup_tool

# Install ansible roles
ansible-galaxy install -r requirements.yml

# Run playbook
CUSTOM_USERNAME=
ansible-playbook -i inventory.yml -l local -e ansible_user=$CUSTOM_USERNAME --ask-become-pass setup.yml
```

# Development

You can use a docker container as host to develop and try out the custom setup tool:

```shell
# Create the image
docker build -t custom_setup_tool_dev:latest -f docker/Dockerfile .

# Start and keep alive container
docker run --name custom_setup_tool_dev --rm -it custom_setup_tool_dev:latest bash

# Run the ansible playbook against the docker container host (requires local ansible installation)
ansible-playbook -i inventory.yml -l dev setup.yml

# Run only specific tags
ansible-playbook -i inventory.yml -l dev --tags "ohmyzsh,homebrew" setup.yml 
```

Clean up the docker container by simply stopping it.
