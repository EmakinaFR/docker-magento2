#!/usr/bin/env bash
set -euo pipefail

# Validate arguments passed to the script
if [[ $# -eq 1 && -n "$1" && -d "$1" ]]; then
    script_path=$(cd $(dirname $0) && pwd)
    project_path=$1
else
    echo "Usage: bash composer_deploy.sh <project_path>"
    exit 1
fi

# Copy only required files to the project directory
mkdir -p "$1"/docker
cp -r "${script_path}"/elasticsearch "$1"/docker/
cp -r "${script_path}"/nginx "$1"/docker/
cp -r "${script_path}"/php "$1"/docker/
cp "${script_path}"/.dockerignore "$1"/docker/
cp "${script_path}"/.env.dist "$1"/docker/
cp "${script_path}"/docker-compose.yml "$1"/docker/
cp "${script_path}"/Makefile "$1"/docker/

# Install the Makefile in the project directory
if [[ ! -f "$1"/Makefile ]]; then
    cp "${script_path}"/Makefile.sample "$1"/Makefile

    project_directory=$(basename $(cd $(dirname $1) && pwd))
    perl -pi -e "s|^PROJECT_PATH := .*|PROJECT_PATH := /var/www/html/${project_directory}|g" "$1"/Makefile

    echo -e "\e[32mA new Makefile has been installed in your project directory.\e[0m"
    echo -e "\e[32mYou can type \"make\" to display the list of available commands.\e[0m"
else
    echo -e "\e[33mYou already have a Makefile in your project directory.\e[0m"
    echo -e "\e[33mTo take advantage of the Docker integration, add the snippet below at the top of your Makefile.\e[0m"

    content=$(cat "${script_path}"/Makefile.sample)
    echo -e "\n\e[3;33m${content}\e[0m"
fi
