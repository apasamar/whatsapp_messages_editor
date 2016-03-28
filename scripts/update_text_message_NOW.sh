#!/bin/bash

IFS="
"

FILE=$1

message=$2

newtext="$3"


obfuscate_num()
{
number=$(echo "$1"|sed -E 's/[0-9]{4}$/xxxx/g')
}

obfuscate_name()
{
	N=0
        x=""
        N=$(echo "$1"|wc -c)
        n=$(($N/2+1))
        str=".{"$n"}$"
        rep=$(for j in $(seq 1 $n); do x=$x"x" ; done ; echo $x)
        name=$(echo $nam | sed -E "s/$str/$rep/")
}


sqlite3 $FILE  "UPDATE ZWAMESSAGE SET ZTEXT=\"$newtext\" WHERE Z_PK=$message;"

output=$(sqlite3 $FILE  "SELECT Z_PK,Z_ENT,Z_OPT,ZCHILDMESSAGESDELIVEREDCOUNT,ZCHILDMESSAGESPLAYEDCOUNT,ZCHILDMESSAGESREADCOUNT,ZDOCID,ZENCRETRYCOUNT,ZFILTEREDRECIPIENTCOUNT,ZFLAGS,ZGROUPEVENTTYPE,ZISFROMME,ZMESSAGEERRORSTATUS,ZMESSAGESTATUS,ZMESSAGETYPE,ZSORT,ZSTARRED,ZCHATSESSION,ZGROUPMEMBER,ZLASTSESSION,ZMEDIAITEM,ZMESSAGEINFO,ZPARENTMESSAGE,datetime(ZMESSAGEDATE + strftime('%s', '2001-01-01 00:00:00'),'unixepoch','localtime') as ZMESSAGEDATE,datetime(ZSENTDATE + strftime('%s', '2001-01-01 00:00:00'),'unixepoch','localtime') as ZSENTDATE,ZFROMJID,ZMEDIASECTIONID,ZPUSHNAME,ZSTANZAID,ZTEXT,ZTOJID FROM ZWAMESSAGE WHERE Z_PK=$message;")


i="$output"

echo "<table class="table">"
echo "    <thead>"
echo "      <tr>"
echo "        <th>#</th>"
echo "        <th>Date</th>"
echo "        <th>Name</th>"
echo "        <th>Number</th>"
echo "        <th>Text</th>"
echo "      </tr>"
echo "    </thead>"
echo "    <tbody>"


num=$(echo $i|cut -d"|" -f1)
date=$(echo $i|cut -d"|" -f24)
nam=$(echo $i|cut -d"|" -f28)
numb=$(echo $i|cut -d"|" -f26|cut -d"@" -f1)
obfuscate_num $numb
obfuscate_name $nam
text=$(echo $i|cut -d"|" -f30)

if [ -z "$name" ]; then
    	color='<font color="red">'
    	name=$color" Me </font>"
fi

if [ -z "$number" ]; then
    	number=$color"************** </font>"
fi

echo "      <tr>"
echo "        <td>"$num"</td>"
echo "        <td>"$date"</td>"
echo "        <td>"$name"</td>"
echo "        <td>+"$number"</td>"
echo "        <td><kbd>"$text"</kbd></td>"
echo "      </tr>"


echo "    </tbody>"
echo "  </table>"


