#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GnuPG to enable PGP-signing commits.
brew install gnupg
# Install IBM Plex Font
brew tap homebrew/cask-fonts
brew install font-ibm-plex --cask
# Remove outdated versions from the cellar.
brew cleanup
