#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
if [[ ! -f ../server.cfg ]]
then
	echo -e "Server should have a config, something is wrong. You might have to manually delete the resource folder/check the mod instructions for more to finsh removing it. :( Aborting!\n"
	exit 1
fi
if [[ -d ../server-data/resources ]]
then
	if [[ ! -d ../server-data/resources/redem ]]
	then
		echo -e "RedEM resource folder could not be found. Leaving...\n"
		exit 1
	else
		rm -rf ../server-data/resources/redem
	fi
else
	echo -e "Server has not been intialized yet, aborting!\n"
	exit 1
fi
