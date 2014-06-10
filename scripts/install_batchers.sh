#!/bin/bash
set -e

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

