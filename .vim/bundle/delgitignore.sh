#!/bin/bash

echo Deleting gitignore files...

while read -r line
do
    echo deleting $line ...
    rm $line
done < <(find ./ -name .gitignore)
