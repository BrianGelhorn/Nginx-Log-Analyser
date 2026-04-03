#!/bin/bash

FILEDIR="$1"

if ! [[ -f "$FILEDIR" ]]; then
	echo "The specified file doesn´t exist"	
	exit 1
fi

TOPREQUESTS="$(awk '{ print $1 }' "$FILEDIR" | sort -r | uniq -c | sort -gr | head -n 5)"
echo "The top 5 IP addresses with the most requests:"
printf "%-20s %s\n" "IP" "REQUESTS"
for ((i=1; i<=5; i++)); do
	IP="$(echo "$TOPREQUESTS" | awk -v i="$i" 'NR==i { print $2 }')"
	REQUESTS="$(echo "$TOPREQUESTS" | awk -v i="$i" 'NR==i { print $1 }')"
	printf "%-20s %s\n" "$IP" "$REQUESTS"
done

echo

TOPREQUESTS="$(awk -F '"' '{ print $2 }' "$FILEDIR" | awk '{ print $2 }' | sort -r | uniq -c | sort -gr | head -n 5)"
echo "The top 5 most requested paths:"
printf "%-30s %s\n" "PATH" "TIMES REQUESTED"

for ((i=1; i<=5; i++)); do
	IP="$(echo "$TOPREQUESTS" | awk -v i="$i" ' NR==i { print $2 }')"
	REQUESTS="$(echo "$TOPREQUESTS" | awk -v i="$i" ' NR==i { print $1 }')"
	printf "%-30s %s\n" "$IP" "$REQUESTS"
done
echo

TOPSTATUSCODES="$(awk -F '"' '{ print $3 }' "$FILEDIR" | awk '{ print $1 }' | sort -r | uniq -c | sort -gr | head -n 5)"
echo "The top 5 most received response status codes:"
printf "%-15s %s\n" "STATUS CODE" "TIMES RECEIVED"

for ((i=1; i<=5; i++)); do
	CODE="$(echo "$TOPSTATUSCODES" | awk -v i="$i" ' NR==i { print $2 }')"
	TIMESRECEIVED="$(echo "$TOPSTATUSCODES" | awk -v i="$i" ' NR==i { print $1 }')"
	printf "%-15s %s\n" "$CODE" "$TIMESRECEIVED"
done
