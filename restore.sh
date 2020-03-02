#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
remove_backup_folder=false
no_backup_yet=false
if [[ -d backup ]]
then
	remove_backup_folder=true
	if [ ! -z "$(ls -A backup)" ]
	then
		echo -e "Backups exist! Current backups:\n(Date, size, name)"
		cd backup
		stat -c "%y %B %n" *
		cd ../
		echo ""
	else
		no_backup_yet=true
	fi
else
	no_backup_yet=true
fi
if [[ $no_backup_yet == true ]]
then
	echo -e "No backup has been set up yet. Do consider the size of your resources and cache and then think about maybe completing a backup.\n"
else
	echo -e "WARNING! Continuing will overwrite active files with these backups!\n"
fi
read -p "Are you sure? You must type RESTORE. " -n 7 -r
echo ""
echo ""
if [[ $REPLY == "RESTORE" ]]
then
	echo -e "Begining restore...\n"	
	# BEGIN RESTORE STUFF
	if [[ -f backup/licensekey.cfg.bak ]] 
	then
		echo -e "Restoring sources.json...\n"
		cp backup/licensekey.cfg.bak ../licensekey.cfg 
	fi

	if [[ -f backup/server.cfg.bak ]] 
	then
		echo -e "Restoring server.cfg...\n"
		cp backup/server.cfg.bak ../server.cfg
	fi
	if [[ -f backup/resources.cfg.bak ]] 
	then
		echo -e "Restoring resources.cfg...\n"
		cp backup/resources.cfg.bak ../resources.cfg
	fi

	echo -e "Retore finished successfully.\n"
else
	echo -e "Prolly just forgot to save your server.cfg heh\n"
fi
