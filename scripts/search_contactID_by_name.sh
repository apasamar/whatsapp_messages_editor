#!/bin/bash

IFS="
"

FILE=$1
searchname=$2

obfuscate_num()
{
number=$(echo $1|sed -E 's/[0-9]{4}$/xxxx/g')
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




output=$(sqlite3 $FILE  "SELECT Z_PK,Z_ENT,Z_OPT,ZARCHIVED,ZCONTACTABID,ZFLAGS,ZHIDDEN,ZMESSAGECOUNTER,ZREMOVED,ZSESSIONTYPE,ZUNREADCOUNT,ZGROUPINFO,ZLASTMESSAGE,ZPROPERTIES, datetime(ZLASTMESSAGEDATE + strftime('%s', '2001-01-01 00:00:00'),'unixepoch','localtime') as ZLASTMESSAGEDATE,ZLOCATIONSHARINGENDDATE,ZCONTACTJID,ZETAG,ZLASTMESSAGETEXT,ZPARTNERNAME,ZSAVEDINPUT FROM ZWACHATSESSION WHERE ZPARTNERNAME LIKE '%$searchname%';")

echo "<table class="table" width="600">"
echo "    <thead>"
echo "      <tr>"
echo "        <th>Chat Session</th>"
echo "        <th>Chatname</th>"
echo "        <th>Chatnumber</th>"
echo "      </tr>"
echo "    </thead>"
echo "    <tbody>"

for i in $(echo "$output"); do
	chatsession=$(echo $i|cut -d"|" -f1)
	teln=$(echo $i|cut -d"|" -f17|cut -d"@" -f1)
	obfuscate_num $teln
	nam=$(echo $i|cut -d"|" -f20)
	obfuscate_name $nam

	echo "      <tr>"
	echo "        <td>"$chatsession"</td>"
	echo "        <td>"$name"</td>"
	echo "        <td>"+$number"</td>"
	echo "      </tr>"


done


echo "    </tbody>"
echo "  </table>"
