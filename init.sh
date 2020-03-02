#!/bin/bash
echo -e "WARNING! This script initializes the server and should only be ran for first time installation or after executing the nuke script.\n"
read -p "Are you sure? You must type INIT. " -n 4 -r
echo ""
echo ""
if [[ $REPLY == "INIT" ]]
then
	echo -e "Checking to make sure base dir is named correctly..\n"
	script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
	cd $script_dir # now we are safe
	base_dir="$(dirname $script_dir)"
	if [[ "$(basename $base_dir)" != "redm" ]]
	then
		echo "carolinhr is not in a folder named redm/carolinhr! Aborting!"
		exit 1
	fi

	echo -e "Creating server-files and server-data directories...\n"
	if [[ -d ../server-files ]]
	then
		echo "server-files directory exists, server is already initialized or needs to be nuked. Aborting!"
		exit 1
	fi
	if [[ -d ../server-data ]] 
	then
		echo "server-data directory exists, server is already initialized or needs to be nuked. Aborting!"
		exit 1
	fi
	mkdir ../server-files
	mkdir ../server-data

#	if [[ ! -d download ]]
#	then
#		echo -e "Making download folder...\n"
#	fi

	echo -e "Fetching latest recommended artifact...\n"
	cd ../server-files
	server_files_artifact_url="$(cat ../carolinhr/sources.json | jq -r '.server_files_artifact_url')"
	wget $server_files_artifact_url
	echo -e "Extracting artifact..\n"
	tar xf fx.tar.xz
	cd ../carolinhr
	
	echo -e "Fetching latest cfx.re server-data repo...\n"
	cd ../server-data
	server_data_cfx_repo="$(cat ../carolinhr/sources.json | jq -r '.server_data_cfx_repo')"
	git clone $server_data_cfx_repo .
	cd ../carolinhr

	./generate-minimum-cfg.sh.dont

	echo "Server initialized, howdy!"
	echo "It is highly recommened that you checkout server.cfg before running the server. You should change your steam id for admin and also set up steam auth."
else
	echo -e "Whew, that was a close one.\n"
fi
