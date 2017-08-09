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
#BACKUP="bbd1153505abb9f87a1f10768fe8bf7671a0355e"   # SET BACKUP FOLDER MANUALY !!!!
BACKUP="a6df71ee1ea688690c8f4a96e7ccfae49fcca69a-20170418-124730"

##################################
#### GET Manifest FILE ###########
MANIFEST=$(/bin/ls $PATH$BACKUP | /usr/bin/grep 'Manifest.db'|/usr/bin/head -n1)
##################################


#### GET ChatStorage.sqlite file from LAST BACKUP #####


CHATSTORAGE=$(/usr/bin/sqlite3 $PATH$BACKUP"/"$MANIFEST "select * from files" |/usr/bin/grep -i ChatStorage.sqlite| /usr/bin/awk -F"|" '{print $1}')
CHATSTORAGE_DIR=$(echo $CHATSTORAGE|/usr/bin/cut -c1,2)
#######################################################

#### PRINT RESULT ################
echo $PATH$BACKUP"/"$CHATSTORAGE_DIR"/"$CHATSTORAGE
##################################
