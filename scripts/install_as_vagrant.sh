#!/usr/bin/env bash
set -e

./scripts/install_nodejs.sh
./scripts/install_batchers.sh
./scripts/download_tomcat.sh
./scripts/install_stubwebservice.sh
./scripts/install_presentation.sh
