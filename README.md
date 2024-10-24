# Dotfiles

### Setup

First clone this repository. To configure wifi run `nmtui`.

```sh
mkdir develop && cd develop
nix-shell -p git
git clone https://github.com/Ekhorn/dotfiles
```

Copy nix configuration to `/etc/nixos`.

```sh
sudo rm -rf /etc/nixos/configuration.nix
sudo cp -rn nixos/* /etc/nixos/
```

Copy dotfiles to home directory.

```sh
cp -r .config/ ~
cp -r .git/ ~
cp .gitconfig ~
cp Pictures/ ~
cp -r Pictures/ ~
cp .tmux.conf ~
cp .unison/ ~
cp -r .unison/ ~
cp .zshrc ~
```

Rename hostname.

```sh
sudo nano /etc/nixos/networking.nix
sudo nano /etc/nixos/flake.nix
sudo nixos-rebuild switch /etc/nixos#hostname
```

Lastly, rebuild the nixos configuration and reboot.

```sh
sudo nixos-rebuild switch
reboot
```

Setup ssh.

```sh
ssh-keygen
sudo nvim /etc/nixos/ssh.nix
# Temporarily enable password login
sudo nixos-rebuild test
```

Run `ssh-copy-id` on other system, and append their public key to our authorized keys.

```sh
ssh-copy-id $USER@my-hostname
ssh $USER@my-hostname "echo '$(cat ~/.ssh/id_rsa.pub)' >> ~/.ssh/authorized_keys"
chmod 600 ~/.ssh/authorized_keys
```

Then disable password login.

```sh
sudo nvim /etc/nixos/ssh.nix
sudo nixos-rebuild test
```

Then configure- and run `unison` and open the password manager.

```sh
nvim ~/.unison/default.prf
unison
keepassxc ~/Desktop/$USER.kdbx
```

Then copy GPG from other system.

```sh
ssh other@hostname 'gpg --export-secret-keys -a "$(gpg -K | rg -o "[A-F0-9]{40}")"' | gpg --import
gpg --edit-key "$(gpg -K | rg -o "[A-F0-9]{40}")"
nix-shell -p seahorse --run "seahorse" # Check if everything is correct
```

Then configure oh-my-zsh.

```sh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
```
