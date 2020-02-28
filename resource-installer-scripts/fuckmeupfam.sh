#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir # now we are safe
echo -e "WARNING! This script installs RedEM and RedEM Roleplay mode and will modify server-data/resources BUT NOT server.cfg. You may want to make a backup first.\n"
read -p "Are you sure? You must type INIT. " -n 4 -r
echo ""
echo ""
if [[ $REPLY != "INIT" ]]
then
		exit 1
fi

cd ../../server-data/resources
rm -rf redem/
git clone https://github.com/kanersps/redem.git

rm -rf esplugin_mysql
git clone https://github.com/RedEM-RP/esplugin_mysql.git

rm -rf mysql-async
git clone https://github.com/amakuu/mysql-async-temporary.git
mv mysql-async-temporary mysql-async

rm -rf \[redemrp\]
mkdir \[redemrp\]
cd \[redemrp\]

rm -rf redem_roleplay
git clone https://github.com/RedEM-RP/redem_roleplay.git

rm -rf redemrp_identity
git clone https://github.com/RedEM-RP/redemrp_identity.git

rm -rf redemrp_respawn
git clone https://github.com/RedEM-RP/redemrp_respawn.git

rm -rf redemrp_skin
git clone https://github.com/RedEM-RP/redemrp_skin.git

rm -rf redemrp_clothing
git clone https://github.com/RedEM-RP/redemrp_clothing.git

rm -rf redemrp_notifcation
git clone https://github.com/Ktos93/redemrp_notification.git

rm -rf redemrp_inventory
git clone https://github.com/RedEM-RP/redemrp_inventory.git

rm -rf redem_admin
git clone https://github.com/Knaak53/-UNOFFICIAL-redemrp_admin.git redem_admin
