

sudo apt update
sudo apt upgrade

# Homebrew list all pakcage dependencies
sudo apt install curl build-essential procps file git

# Install brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# install kube-ps1
brew install kube-ps1
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# Install Rust packages
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

# install exa
cargo install exa

# docker install 
sudo apt -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add GPG key of Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# Add reposiitory for Docker
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker $USER

# Add reposiitory for Kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

# Install Kubernetes
sudo apt update
sudo apt install -y kubeadm kubelet kubectl

