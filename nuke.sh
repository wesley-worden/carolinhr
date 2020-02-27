#!/bin/bash
echo -e "WARNING! This script nukes the server and sets it up to be reinitialized. Your license key WILL BE LOST! It is STRONGLY suggested that you run the backup script first.\n"
read -p "Are you sure? You must type NUKE. " -n 4 -r
echo ""
if [[ $REPLY == "NUKE" ]]
then
	script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
	cd $script_dir # now we are safe
	echo -e "Launching tactical nuke!\n"
	base_dir="$(dirname $script_dir)"
	# BEGIN NUKE STUFF

	if [[ -d /tmp/carolinhr/backup ]] 
	then 
		echo -e "Deleting old temp file...\n"
		rm -rf /tmp/carolinhr/backup
	fi

	backup_exists=false
	if [[ -f backup ]] 
	then
		if [ ! -z "$(ls -A backup)" ]
		then
			echo -e "Backups exist! The backups WILL NOT BE DESTROYED from the nuke but they WILL NOT BE RESTORED. Run the restore script to do so.\n"
			backup_exists=true
			cp -r backup /tmp/carolinhr/backup
		else
			echo -e "No backups to worry about.\n"
		fi
	fi
	cd $base_dir
	cd ../
	rm -rf $base_dir # remove redm
	mkdir redm
	cd redm
	git clone https://github.com/PepeSilvia215/carolinhr.git
	cd redm/carolinhr
	if [[ $backup_exists == true ]]
	then
		cp -r /temp/carolinhr/backup backup
	fi

	echo  "Operation completed with no survivors."
else
	echo -e "Submarines returning to standby, Mr. President.\n"
fi
