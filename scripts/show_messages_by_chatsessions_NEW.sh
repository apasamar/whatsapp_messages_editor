#!/bin/bash

IFS="
"

FILE=$1

chatsession=$2

LINES=15

ofuscate_num()
{
number=$(echo "$1"|sed -E 's/[0-9]{4}$/xxxx/g')
}

ofuscate_name()
{
	N=0
        x=""
        N=$(echo "$1"|wc -c)
        n=$(($N/2+1))
        str=".{"$n"}$"
        rep=$(for j in $(seq 1 $n); do x=$x"x" ; done ; echo $x)
        name=$(echo $nam | sed -E "s/$str/$rep/")
}


output=$(sqlite3 $FILE "SELECT Z_PK,Z_ENT,Z_OPT,ZCHILDMESSAGESDELIVEREDCOUNT,ZCHILDMESSAGESPLAYEDCOUNT,ZCHILDMESSAGESREADCOUNT,ZDOCID,ZENCRETRYCOUNT,ZFILTEREDRECIPIENTCOUNT,ZFLAGS,ZGROUPEVENTTYPE,ZISFROMME,ZMESSAGEERRORSTATUS,ZMESSAGESTATUS,ZMESSAGETYPE,ZSORT,ZSTARRED,ZCHATSESSION,ZGROUPMEMBER,ZLASTSESSION,ZMEDIAITEM,ZMESSAGEINFO,ZPARENTMESSAGE,datetime(ZMESSAGEDATE + strftime('%s', '2001-01-01 00:00:00'),'unixepoch','localtime') as ZMESSAGEDATE,datetime(ZSENTDATE + strftime('%s', '2001-01-01 00:00:00'),'unixepoch','localtime') as ZSENTDATE,ZFROMJID,ZMEDIASECTIONID,ZPUSHNAME,ZSTANZAID,ZTEXT,ZTOJID FROM ZWAMESSAGE WHERE ZCHATSESSION=$chatsession ORDER BY Z_PK ASC;")


last=$(echo "$output" | tr "\n" "#" | sed -e 's/#\([0-9]*\)|/¨\1|/g'| tr "¨" "\n"|sed 's/\#/\[RET\]/g'|tail -n $LINES)

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

for i in `echo "$last"`; do 
	color='<font color="blue">'
	num=$(echo $i|cut -d"|" -f1)
	date=$(echo $i|cut -d"|" -f24)
	nam=$(echo $i|cut -d"|" -f28)
	ofuscate_name $nam
	if [ -z "$name" ]; then
    		color='<font color="red">'
    		name=$color" Me </font>"
	fi

	numb=$(echo $i|cut -d"|" -f26|cut -d"@" -f1)
	ofuscate_num $numb
	if [ -z "$number" ]; then
    		number=$color"xxxxxxxxxxxxx </font>"
	fi
	text=$(echo $i|cut -d"|" -f30|sed 's/\"//g')

	echo "      <tr>"
	echo "        <td>"$num"</td>"
	echo "        <td>"$date"</td>"
	echo "        <td>"$name"</td>"
	echo "        <td>+"$number"</td>"
	echo "        <td>"$color$text"</font></td>"
	echo "      </tr>"

done

echo "    </tbody>"
echo "  </table>"


