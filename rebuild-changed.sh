#!/bin/sh

for XML in $(git ls-files -m docsets/*.xml); do
    YML=$(echo $XML | sed -e 's/docsets/configs/;s/xml$/yml/')
    java -jar docset-builder-1.0-all.jar $YML docsets
    DOCSET=$(echo $XML | sed -e 's/xml$/docset/;s/_/ /g;s/^docsets\///')
    TGZ=$(echo $XML | sed -e 's/xml$/tgz/;s/_/ /g')
    tar -C docsets -czvf "$TGZ" "$DOCSET"
    rm -rf "docsets/$DOCSET"
done
