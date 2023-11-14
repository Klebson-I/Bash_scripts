#!/bin/bash

params=($@)

ping_count=${params[0]}

db_file=${params[1]}

url_to_ping=${params[2]}

if [[ $ping_count -le 0 ]]
    then
        echo "No count given"
        exit 1
fi

if [[ ${#db_file} -lt 4  ]]
    then
        echo "No file given"
        exit 2
fi

if [[ ${#url_to_ping} -lt 4  ]]
    then
        echo "No url given"
        exit 3
fi

> $db_file
echo "Ping $url_to_ping url" >> $db_file

for ((i=0; i<$ping_count; i++));
    do
        ping_result=$(ping $url_to_ping)
        echo "$(($i+1)). $ping_result"
        echo $ping_result >> $db_file
        sleep 1
done

