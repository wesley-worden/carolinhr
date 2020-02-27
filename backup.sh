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
	echo -e "No backup has been set up yet. Do consider the size of your resources and cache before completing a backup.\n"
else
	echo -e "WARNING! Continuing will overwrite these backups!\n"
fi
read -p "Are you sure? You must type BACKUP. " -n 6 -r
echo ""
echo ""
if [[ $REPLY == "BACKUP" ]]
then
	if [[ $remove_backup_folder == true ]] 
	then
		echo -e "Removing backups...\n"
		rm -rf backup
	fi

	echo -e "Begining backup...\n"
	mkdir backup	
	# BEGIN BACKUP STUFF
	if [[ -f sources.json ]]
	then
		echo -e "Backing up sources.json...\n"
		cp sources.json backup/sources.json.bak
	fi

	if [[ -f ../server-data/server.cfg ]] 
	then
		echo -e "Backing up server.cfg..\n"
		cp ../server.cfg backup/server.cfg.bak
	fi
	
	echo -e "Backup completed successfully.\n"
else
	echo -e "Prolly just forgot to save your server.cfg heh\n"
fi
