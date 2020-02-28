#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
echo -e "WARNING! This script installs RedEM and will modify server-data/resources and server.cfg. You may want to make a backup first.\n"
read -p "Are you sure? You must type INIT. " -n 4 -r
echo ""
echo ""
if [[ $REPLY != "INIT" ]]
then
	exit 1
fi

if [[ ! -f ../server.cfg ]]
then
	echo -e "The server needs a config before you want to install any resources, aborting!\n"
	exit 1
fi
if [[ -d ../server-data/resources ]]
then
	if [[ -d ../server-data/resources/redem ]]
	then
		echo -e "RedEM has already been installed! Aborting!\n"
		exit 1
	else
		cd ../server-data/resources
		echo -e "Cloning RedEM repo...\n"
		resource_redem_repo="$(cat ../../carolinhr/sources.json | jq -r '.resource_redem_repo')"
		git clone $resource_redem_repo
		cd $script_dir
		echo -e "Adding lines to server config...\n"
		echo "ensure redem" >> ../server.cfg


	fi
else
	echo -e "Server has not been intialized yet, aborting!\n"
	exit 1
fi
