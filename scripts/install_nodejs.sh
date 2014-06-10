#!/bin/bash
set -e

rm -rf ~/.ndenv
git clone https://github.com/riywo/ndenv ~/.ndenv
echo 'export PATH="$HOME/.ndenv/bin:$PATH"' > ~/.bash_profile
echo 'eval "$(ndenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
ndenv install v0.10.28
ndenv global v0.10.28
ndenv rehash

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

rm -rf ~/.local/lib/node_modules
echo "prefix = ~/.local
root = ~/.local/lib/node_modules
binroot = ~/.local/bin
manroot = ~/.local/share/man" | tee ~/.npmrc


npm install -g karma karma-ng-scenario karma-junit-reporter karma-jasmine
npm install karma-chrome-launcher --save-dev
npm install karma-firefox-launcher -g
npm install karma-jasmine --save-dev


rm -rf ~/.local/bin/karma
mkdir -p ~/.local/bin/
ln -s ~/.local/lib/node_modules/karma/bin/karma ~/.local/bin/karma