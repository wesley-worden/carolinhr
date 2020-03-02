#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
if [[ ! -f mysql-password ]]
then
			echo -e "No mysql-password file, aborting!\n"
					exit 1
fi
if [[ ! -f mysql-user ]]
then
			echo -e "No mysql-user file, aborting!\n"
					exit 1
fi
echo -e "WARNING! This script deletes all the resources in the server-data/resources/[carolinhr] folder.\n"
read -p "Are you sure? You must type NUKE. " -n 4 -r
echo ""
if [[ ! $REPLY == "NUKE" ]]
then
	exit 1
fi
if [[ -d ../server-data/resources/\[carolinhr\] ]]
then
	echo "Removing carolinhr resource folder..."
	rm -rf ../server-data/resources/\[carolinhr\]
else
	echo "Nothing to nuke :("
fi
if [[ -f ../resources.cfg ]]
then
	echo "Removing resources.cfg..."
	rm ../resources.cfg
else
	echo "no resource.cfg to delete"
fi

echo "DROP DATABASE redemrp;" | mysql --user="$(cat mysql-user)" --password="$(cat mysql-password)"
