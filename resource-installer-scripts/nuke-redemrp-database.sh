#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
if [[ ! -f mysql-password ]]
then
	echo -e "No mysql-password file, aborting!\n"
	exit
fi
if [[ ! -f mysql-user ]]
then
	echo -e "No mysql-user file, aborting!\n"
	exit
fi
echo -e "WARNING! This script resets the mysql databse for redemrp"
read -p "Are you sure? You must type NUKE. " -n 4 -r
echo ""
echo ""
if [[ ! $REPLY == "NUKE" ]]
then
	exit 1
fi
echo -e "DROP DATABASE redemrp; CREATE DATABASE redemrp;\n"
mysql --user="$(cat mysql-user)" --password="$(cat mysql-password)" --database="redemrp" --execute="DROP DATABASE redemrp; CREATE DATABASE redemrp;"
