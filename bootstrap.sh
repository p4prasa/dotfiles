# software update and cli tools install

echo "\nupdating software...\n"
sudo softwareupdate -i -a
echo "\nsoftware update done.\n"

echo "\nupdating cli tools...\n"
xcode-select --install
echo "\ncli tools update done.\n"

# install oh-my-zsh

echo "\ninstalling oh-my-zsh...\n"

export ZSH=~/.oh-my-zsh

if [ ! -d $ZSH ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH
fi

echo "\noh-my-zsh installation done.\n"

# change shell to zsh

chsh -s $(which zsh)
echo "\nshell changed to zsh.\n"

# copy .zshrc and source (oh-my-zsh, alias, path)

cp .zshrc ~/
cp .omz_config ~/
cp .aliases ~/
cp .paths ~/
source ~/.zshrc

# set mac os defaults

source .macos_defaults

# install brew and install apps through home brew

# Check for Homebrew
if test ! "$(command -v brew)"; then
  echo "\nInstalling Homebrew...\n"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "\nHomebrew installation done.\n"
fi

# Run Homebrew through the Brewfile
echo "\ninstalling brew bundle...\n"
brew bundle install
echo "\nbrew bundle installation done.\n"


# do mackup restore

cp .mackup.cfg ~/
echo "\nmackup restore\n"
mackup restore
