#!/bin/bash
echo -e "Checking to make sure base dir is named correctly..\n"
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
base_dir="$(dirname $script_dir)"
if [[ "$(basename $base_dir)" != "redm" ]]
then
	echo "carolinhr is not in a folder named redm/carolinhr! Aborting!"
	exit 1
fi
cd $base_dir

echo -e "REMEMBER!\n"
sleep 1
echo -e "Be rootin, "
sleep 0.5
echo "be tootin, "
sleep 0.5
echo "and by god be shootin. "
sleep 0.5
echo "But most of all, "
sleep 1
echo -e "be kind.\n"
sleep 1

echo -e "Starting server!\n"
bash server-files/run.sh +exec server.cfg +set gamename rdr3
