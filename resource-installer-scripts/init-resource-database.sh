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
echo -e "WARNING! This script resets the mysql databse for the redemrp modules and deletes all their data! It will then inject the correct sql files depending on what resources are installed. But its not my fault if you dont have the dependent resources installed that need injected! Check each resources README if you are unsure. \n"
read -p "Are you sure? You must type NUKE. " -n 4 -r
echo ""
echo ""
if [[ ! $REPLY == "NUKE" ]]
then
	exit 1
fi
echo -e "DROP DATABASE redemrp; CREATE DATABASE redemrp;\n"
mysql --user="$(cat mysql-user)" --password="$(cat mysql-password)" --database="redemrp" --execute="DROP DATABASE redemrp; CREATE DATABASE redemrp;"
echo -e "Done. Begin reinjecting sql files...\n"
if [[ -d ../../server-data/resources/esplugin_mysql/ ]]
then
	if [[ ! -f ../../server-data/resources/esplugin_mysql/esplugin_mysql.sql ]]
	then
		echo -e "esplugin_mysql is corrupt\n"
	else
		echo  "doin esplugin_mysql "
		mysql --user="$(cat mysql-user)" --password="$(cat mysql-password)" --database="redemrp" < ../../server-data/resources/esplugin_mysql/esplugin_mysql.sql
	fi
fi
if [[ -d ../../server-data/resources/esplugin_mysql/ ]]
then
	if [[ ! -f ../../server-data/resources/esplugin_mysql/esplugin_mysql.sql ]]
	then
		echo -e "esplugin_mysql is corrupt\n"
	else
		echo  "doin esplugin_mysql "
		mysql --user="$(cat mysql-user)" --password="$(cat mysql-password)" --database="redemrp" < ../../server-data/resources/esplugin_mysql/esplugin_mysql.sql
	fi
fi

echo -e "finish injectin\n"
