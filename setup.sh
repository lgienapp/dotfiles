#!/usr/bin/env bash

# =============================================================================
# Environment Setup
# =============================================================================
# Run: chmod +x setup-dev.sh && ./setup-dev.sh
# =============================================================================

set -e

# =============================================================================
# XCODE COMMAND LINE TOOLS
# =============================================================================

if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    
    # Wait for installation to complete
    echo "Waiting for Xcode CLI tools installation..."
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
else
    echo "Xcode CLI tools already installed."
fi

# =============================================================================
# HOMEBREW
# =============================================================================

if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    fi
else
    echo "Homebrew already installed."
fi

# Update Homebrew
brew update

# =============================================================================
# BREW PACKAGES
# =============================================================================

brew install jq
brew install imagemagick
brew install kubernetes-cli
brew install xz
brew install zstd
brew install pandoc
brew install uv
brew install qrencode
brew install hugo

# =============================================================================
# BREW Casks
# =============================================================================

brew install --cask openvpn-connect
brew install --cask vscodium
brew install --cask keepassxc
brew install --cask protonvpn
brew install --cask mactex-no-gui
brew install --cask affinity
brew install --cask claude
brew install --cask claude-code
brew install --cask pycharm
brew install --cask slack
brew install --cask discord
brew install --cask mattermost

# =============================================================================
# Fonts
# =============================================================================

brew install --cask font-intel-one-mono
brew install --cask font-crimson-pro

# =============================================================================
# OH MY ZSH
# =============================================================================

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    
    # Set theme to daveverwer
    sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="daveverwer"/' ~/.zshrc
else
    echo "Oh My Zsh already installed."
    # Ensure theme is set
    if grep -q 'ZSH_THEME="robbyrussell"' ~/.zshrc; then
        sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="daveverwer"/' ~/.zshrc
    fi
fi

# Prevents "Last login ..." messages on tty startup
touch ~/.hushlogin

# =============================================================================
# SUMMARY
# =============================================================================

echo ""
echo "============================================="
echo "Setup complete!"
echo "============================================="
echo ""
echo "Restart your terminal or run: source ~/.zshrc"
echo ""
