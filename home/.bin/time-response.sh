#!/bin/bash
CURL="curl"
GAWK="gawk"
echo -n "Please pass the url you want to measure: "
read url
URL="$url"
result=`$CURL -o /dev/null -k -s -w %{time_connect}:%{time_starttransfer}:%{time_total} $URL`
echo " Time_Connect Time_startTransfer Time_total "
echo $result | $GAWK -F: '{ print $1" "$2" "$3}'
