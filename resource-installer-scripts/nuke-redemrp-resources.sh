#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
echo -e "WARNING! This script deletes all the resources in the server-data/resources/[carolinhr] folder.\n"
read -p "Are you sure? You must type NUKE. " -n 4 -r
echo ""
if [[ ! $REPLY == "NUKE" ]]
then
	exit 1
fi
if [[ -d ../../server-data/resources/\[carolinhr\] ]]
then
	echo "Removing carolinhr resource folder..."
	rm -rf ../../server-data/resources/\[carolinhr\]
else
	echo "Nothing to nuke :("
fi
