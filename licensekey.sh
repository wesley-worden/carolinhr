#!/bin/bash
sv_licenseKey="$(cat sources.json | jq -r '.sv_licenseKey')"
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
	read -p "Would you like to set the license key now (Y/n)?" -n 1 -r
else
	read -p "Would you like to change the license key now (Y/n)?" -n 1 -r
fi
echo ""
echo ""
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]
then
	#echo -e "Go to https://keymaster.fivem.net and sign in or register an account. Then register a license key for your server. When you are done copy it to your clipboard, click in this terminal window and paste it in. Most terminals require you to pres Control Shift V."
	read -p "Go to https://keymaster.fivem.net and sign in or register an account. Then register a license key for your server. When you are done copy it to your clipboard, click in this terminal window and paste it in. Most terminals require you to pres Control Shift V.`echo $'\n> '`" -n 32 -r
	echo ""
	cat sources.json | jq '.sv_licenseKey = $REPLY' --arg REPLY "$REPLY" > sources.json.temp
	mv sources.json.temp sources.json
	echo -e "License key updated!"
fi
