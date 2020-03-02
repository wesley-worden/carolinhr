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
	if [[ -f ../licensekey.cfg ]]
	then
		echo -e "Backing up license key...\n"
		cp ../licensekey.cfg backup/licensekey.cfg.bak
	fi

	if [[ -f ../server.cfg ]] 
	then
		echo -e "Backing up server.cfg..\n"
		cp ../server.cfg backup/server.cfg.bak
	fi
	
	if [[ -f ../resources.cfg ]] 
	then
		echo -e "Backing up resources.cfg..\n"
		cp ../resources.cfg backup/resources.cfg.bak
	fi

	if [[ -f mysql-user ]]
	then
		echo "Backing up mysql-user..."
		cp mysql-user backup/mysql-user.bak
	fi

	if [[ -f mysql-password ]]
	then
		echo "Backing up mysql-password..."
		cp mysql-password backup/mysql-password.bak
	fi
	
	echo -e "Backup completed successfully.\n"
else
	echo -e "Prolly just forgot to save your server.cfg heh\n"
fi
