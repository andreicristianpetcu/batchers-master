#!/bin/bash
set -e

#move somewhere generic
export DISPLAY=:10

source ~/.bashrc

cd ~
rm -rf batchers
echo "6"
git clone https://github.com/cegeka/batchers.git
echo "7"
cd ~/batchers/taxcalculator
echo "8"
mvn clean install
echo "9"

cd taxcalculator-presentation
echo "10"
mvn package
echo "11"
#~/batchers/taxcalculator/taxcalculator-presentation/target/taxcalculator-presentation-1.0-SNAPSHOT.war

cd ../taxcalculator-stubwebservice/
echo "12"
mvn package
echo "13"

