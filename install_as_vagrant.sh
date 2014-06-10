#!/usr/bin/env bash
set -e

./install_nodejs.sh
./install_batchers.sh
./download_tomcat.sh
./install_stubwebservice.sh
./install_presentation.sh
