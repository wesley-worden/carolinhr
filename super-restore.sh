#!/bin/bash
#!/bin/bash
if [[ -d /tmp/carolinhr/backup ]]
then
	echo -e "There is a super backup temporarily available. Sorry to hear you are having issues. But it's probably your (my) own fault.\n"
else
	echo "/tmp/carolinhr doesn't exist no more, sorry friend :("
	exit 1
fi
echo -e "WARNING! This script restores the backup saved to /tmp (if it's still there) while nuking. You should only use this if someting went wrong during a nuke. Check your existing backup because this will overwrite your current backup folder if you currently have one!\n"
read -p "Are you sure? You must type HALP. " -n 4 -r
echo ""
if [[ $REPLY == "HALP" ]]
then
	script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
	cd $script_dir # now we are safe
	if [[ -d backup ]]
	then
		rm -rf backup
	fi
	cp -r /tmp/carolinhr/backup backup
fi
