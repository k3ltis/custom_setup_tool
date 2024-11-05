# Custom Unix Setup Tool

The time spent on installing the same CLI tools in fresh environments over and over again is _too damn high_.
This tool allows to quickly setup a unix-based evironment (for me usually WSL2) by installing my favorite tools and configuration using Ansible.

# Prerequisites for WSL2

```shell
# Install pipx
sudo apt install pipx

# Install ansible
pipx install --include-deps ansible
```

# Usage

```shell
# Install ansible roles
ansible-galaxy install -r requirements.yml

# Run the playbook on the localhost (requires local ansible installation), verify with `--check/-C`
CUSTOM_USERNAME=
ansible-playbook -i inventory.yml -l local -e ansible_user=$CUSTOM_USERNAME setup.yml
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

# TODOs

* Docker
    * [Docker for WSL2](https://dev.to/bowmanjd/install-docker-on-windows-wsl-without-docker-desktop-34m9)
* Podman
* fzf keybindings `$(brew --prefix)/opt/fzf/install`
* vscode configuration
* optimization with stow

# Manual Installs

* Python pipx `sudo apt install pipx`
* Golang `sudo snap install go`
* Java `sudo apt install openjdk-17-jre-headless`