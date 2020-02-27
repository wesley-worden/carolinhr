#!/bin/bash
echo -e "WARNING! This script nukes the server and sets it up to be reinitialized. It is STRONGLY suggested that you run the backup script first.\n"
read -p "Are you sure? You must type NUKE. " -n 4 -r
echo ""
if [[ $REPLY == "NUKE" ]]
then
	script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
	cd $script_dir # now we are safe
	echo -e "Launching tactical nuke!\n"
	base_dir="$(dirname $script_dir)"
	# BEGIN NUKE STUFF

	cd $base_dir
	if [[ -d /tmp/carolinhr ]] 
	then 
		echo -e "Deleting old temp file...\n"
		rm -rf /tmp/carolinhr
	fi

	cp -r carolinhr /tmp/carolinhr
	cd ../
	rm -rf $base_dir
	mkdir redm
	cp -r /tmp/carolinhr redm/carolinhr
	cd redm/carolinhr

	echo  "Operation completed with no survivors."

else
	echo -e "Submarines returning to standby, Mr. President.\n"
fi
