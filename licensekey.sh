#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
base_dir="$(dirname $script_dir)"
if [[ ! -f ../licensekey.cfg ]]
then
	echo -e "sv_licenseKey changeme\n" > ../licensekey.cfg
fi
sv_licenseKey="$(cat ../licensekey.cfg | cut -c 14-)"
set_key=true
if [[ ! $sv_licenseKey =~ ^[a-zA-Z0-9]{32}$ ]]
then
	echo -e "The license key is not set up yet.\n"
else
	echo -e "The license key is currently set to:\n"
	echo -e "$sv_licenseKey\n"
	set_key=false
fi
#echo ""
if [[ $set_key == true ]] 
then
	read -p "Would you like to set the license key now (Y/n?)" -n 1 -r
else
	read -p "Would you like to change the license key now (Y/n)?" -n 1 -r
fi
echo ""
echo ""
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]
then
	read -p "Go to https://keymaster.fivem.net and sign in or register an account. Then register a license key for your server. When you are done copy it to your clipboard, click in this terminal window and paste it in. Most terminals require you to pres Control Shift V.`echo $'\n> '`" -n 32 -r
	sv_licenseKey=$REPLY
	echo ""
	echo -e "sv_licenseKey $sv_licenseKey\n" > ../licensekey.cfg
	
	echo -e "License key updated!"
fi
