#!/bin/bash
set -e

rm -rf ~/.ndenv
git clone https://github.com/riywo/ndenv ~/.ndenv
echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(ndenv init -)"' >> ~/.bashrc

export PATH="$HOME/.ndenv/bin:$PATH"

echo "$PATH"
git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
ndenv install v0.10.28
ndenv global v0.10.28
ndenv rehash

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.local/bin:$PATH"

rm -rf ~/.local/lib/node_modules
echo "prefix = ~/.local
root = ~/.local/lib/node_modules
binroot = ~/.local/bin
manroot = ~/.local/share/man" | tee ~/.npmrc


echo "-1"
npm install -g karma karma-ng-scenario karma-junit-reporter karma-jasmine
npm install karma-chrome-launcher --save-dev
npm install karma-firefox-launcher -g
npm install karma-jasmine --save-dev


echo "0"
rm -rf ~/.local/bin/karma
echo "1"
mkdir -p ~/.local/bin/
echo "2"
ln -s ~/.local/lib/node_modules/karma/bin/karma ~/.local/bin/karma
echo "3"
