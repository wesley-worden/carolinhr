#!/bin/bash
echo -e "WARNING! This script nukes the server and sets it up to be reinitialized. It is STRONGLY suggested that you run the backup script first.\n"
read -p "Are you sure? You must type NUKE. " -n 4 -r
echo ""
if [[ $REPLY == "NUKE" ]]
then
	script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
	cd $script_dir # now we are safe
	echo -e "Launching tactical nuke!\n"
	# BEGIN NUKE STUFF

else
	echo -e "Submarines returning to standby, Mr. President.\n"
fi
