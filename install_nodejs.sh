# install nodejs
rm -rf ~/.ndenv
git clone https://github.com/riywo/ndenv ~/.ndenv
echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(ndenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
ndenv install v0.10.28
ndenv global v0.10.28
ndenv rehash

npm install -g karma-ng-scenario karma-junit-reporter
npm install -g karma-jasmine
npm install karma-chrome-launcher --save-dev
npm install karma-firefox-launcher --save-dev
npm install karma-jasmine --save-dev
