# install nodejs
set -e

rm -rf ~/.ndenv
git clone https://github.com/riywo/ndenv ~/.ndenv
echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bash_profile
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

# source ~/.npmrc

npm install -g karma karma-ng-scenario karma-junit-reporter karma-jasmine
npm install karma-chrome-launcher --save-dev
npm install karma-firefox-launcher -g
npm install karma-jasmine --save-dev


rm -rf ~/.local/bin/karma
mkdir -p ~/.local/bin/
ln -s ~/.local/lib/node_modules/karma/bin/karma ~/.local/bin/karma

cd ~
rm -rf batchers
git clone https://github.com/cegeka/batchers.git
cd ~/batchers/taxcalculator
mvn clean install

cd taxcalculator-presentation
mvn package
# ~/batchers/taxcalculator/taxcalculator-presentation/target/taxcalculator-presentation-1.0-SNAPSHOT.war

cd ../taxcalculator-stubwebservice/
mvn package
# kill jetty if exists
# mvn jetty:run </dev/null &>/dev/null &

# install tomcat
cd ~
rm -rf apache-tomcat-*
wget http://apache.cu.be/tomcat/tomcat-7/v7.0.54/bin/apache-tomcat-7.0.54.tar.gz
tar -xf apache-tomcat-7.0.54.tar.gz
cp -r apache-tomcat-7.0.54 apache-tomcat-7.0.54-stubwebservice

#change tomcat port form 8080 to 9090
sed -i 's/"8080"/"9090"/g' ~/apache-tomcat-7.0.54/conf/server.xml
apache-tomcat-7.0.54/bin/catalina.sh start

sed -i 's/"8080"/"9091"/g' ~/apache-tomcat-7.0.54-stubwebservice/conf/server.xml
sed -i 's/"8009"/"8010"/g' ~/apache-tomcat-7.0.54-stubwebservice/conf/server.xml
sed -i 's/"8005"/"8006"/g' ~/apache-tomcat-7.0.54-stubwebservice/conf/server.xml
apache-tomcat-7.0.54-stubwebservice/bin/catalina.sh start

rm -rf ~/apache-tomcat-7.0.54/webapps/taxcalculator-*
cp ~/batchers/taxcalculator/taxcalculator-presentation/target/taxcalculator-presentation-1.0-SNAPSHOT.war ~/apache-tomcat-7.0.54/webapps/taxcalculator.war

rm -rf ~/apache-tomcat-7.0.54-stubwebservice/webapps/taxcalculator-*
cp ~/batchers/taxcalculator/taxcalculator-stubwebservice/target/taxcalculator-stubwebservice-1.0-SNAPSHOT.war ~/apache-tomcat-7.0.54-stubwebservice/webapps/stubwebservice.war
