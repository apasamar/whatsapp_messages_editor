#!/bin/bash


IFS="
"

##### SET USER HOME DIRECTORY ####
source ../config.txt
##################################

##### IPHONE BACKUP PATH #########
PATH=$USER/$backup_path
##################################

#### GET LAST IPHONE BACKUP ######
BACKUP=$(/bin/ls -t $PATH|/usr/bin/head -n1)



#####   ATTENTION !!!!!! #########
# THIS LINE IS FOR TESTING PURPOSES ONLY. COMMENT IT AFTER TEST
BACKUP="bbd1153505abb9f87a1f10768fe8bf7671a0355e"   # SET BACKUP FOLDER MANUALY !!!!



##################################
#### GET Manifest FILE ###########
MANIFEST=$(/bin/ls $PATH$BACKUP | /usr/bin/grep 'Manifest.mbdb')
##################################

#### GET ChatStorage.sqlite file from LAST BACKUP #####
CHATSTORAGE=$(/usr/bin/python ../scripts/listManifest.py $PATH$BACKUP"/"$MANIFEST | /usr/bin/grep 'ChatStorage.sqlite'| /usr/bin/cut -d"|" -f10)
#######################################################

#### PRINT RESULT ################
echo $PATH$BACKUP"/"$CHATSTORAGE
##################################
