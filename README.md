# Dotfiles

1. Give Terminal (or whatever tty app you use) full disk access (`System Preferences -> Privacy -> Full Disk Access`)
2. Execute:
```
sudo -v && \
curl -fsSL https://raw.githubusercontent.com/lgienapp/dotfiles/refs/heads/main/defaults.sh | bash && \
curl -fsSL https://raw.githubusercontent.com/lgienapp/dotfiles/refs/heads/main/setup.sh | bash
```
