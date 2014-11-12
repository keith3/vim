#!/bin/bash

echo Deleting gitignore files...

while read -r line
do
    echo deleting $line ...
    rm -rf $line
done < <(find ./ -name .git*)
