#!/usr/bin/env bash

# =============================================================================
# Environment Setup
# =============================================================================
# Run: chmod +x setup-dev.sh && ./setup-dev.sh
# =============================================================================

set -e

echo "Setting up environment..."

# =============================================================================
# XCODE COMMAND LINE TOOLS
# =============================================================================

if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    
    # Wait for installation to complete
    echo "Waiting for Xcode CLI tools installation..."
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
    echo "Xcode CLI tools installed."
else
    echo "Xcode CLI tools already installed."
fi

# =============================================================================
# HOMEBREW
# =============================================================================

if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
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

echo "Installing Homebrew packages..."

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


# =============================================================================
# OH MY ZSH
# =============================================================================

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Installing Oh My Zsh..."
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

# =============================================================================
# BASICTEX
# =============================================================================

echo "Installing BasicTeX..."
brew install --cask basictex

# Add TeX to PATH
eval "$(/usr/libexec/path_helper)"
export PATH="/Library/TeX/texbin:$PATH"

# Install essential LaTeX packages
echo "Installing LaTeX packages..."
sudo tlmgr update --self
sudo tlmgr install \
    latexmk biber biblatex biblatex-apa \
    collection-fontsrecommended collection-mathscience \
    beamer pgf tikz-cd tikzfill tikzmark \
    booktabs caption csquotes enumitem fancyhdr float \
    geometry hyperref microtype multirow parskip \
    setspace subcaption titlesec tocloft xcolor \
    algorithm2e algorithmicx algpseudocode listings minted \
    todonotes soul xpatch etoolbox \
    appendix pdfpages pdflscape \
    amsmath amssymb amsthm mathtools \
    natbib cite \
    tcolorbox environ trimspaces adjustbox \
    siunitx

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