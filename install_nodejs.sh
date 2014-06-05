# install nodejs
rm -rf ~/.ndenv
git clone https://github.com/riywo/ndenv ~/.ndenv
# echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bash_profile
# echo 'eval "$(ndenv init -)"' >> ~/.bash_profile
exec $SHELL -l
mkdir -p ~/.ndenv/plugins/
git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
ndenv install v0.10.28
ndenv global v0.10.28
ndenv rehash
