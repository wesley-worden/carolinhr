#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
echo -e "WARNING! This script uninstalls RedEM and will modify server-data/resources and server.cfg. You may want to make a backup first.\n"
read -p "Are you sure? You must type NUKE. " -n 4 -r
echo ""
echo ""
if [[ $REPLY != "NUKE" ]]
then
		exit 1
fi

if [[ ! -f ../../server.cfg ]]
then
	echo -e "Server should have a config, something is wrong. You might have to manually delete the resource folder/check the mod instructions for more to finsh removing it. :( Aborting!\n"
	exit 1
fi
if [[ -d ../../server-data/resources ]]
then
	if [[ ! -d ../../server-data/resources/redem ]]
	then
		echo -e "RedEM resource folder could not be found. Leaving...\n"
		exit 1
	else
		echo -e "Removing RedEM resource folder...\n"
		rm -rf ../../server-data/resources/redem
		echo -e "Removing server config lines...\n"
		sed -i '/ensure redem/d' ../../server.cfg

	fi
else
	echo -e "Server has not been intialized yet, aborting!\n"
	exit 1
fi
