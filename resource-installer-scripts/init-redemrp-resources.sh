#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
resources="$(echo $(cat resources.json | jq -r '.resources[]'))"
echo -e "About to install the following resources:"
echo -e "$(echo $resources | tr " " "\n")"
echo ""
if [[ ! -d ../../server-data/resources ]]
then
	echo -e "Server has not been initialized yet, aborting!\n"
	exit 1
else
	if [[ ! -d ../../server-data/resources/\[carolinhr\] ]]
	then
		echo -e "making [carolinhr] resource folder...\n"
		mkdir \[carolinhr\]
	fi
	cd ../../server-data/resources/\[carolinhr\]
	for resource in $resources
	do
		if [[ -d resource ]]
		then
			echo -e "$resource is already installed, double check the resources folder, this script should really only be run after the server has been initialized."
			exit 1
		fi
	done
fi

for resource in
do
	repo="$(cat resources.json | jq -r -- arg resource "$resource" '.repos[].[$resource]')"
	echo $repo
done
