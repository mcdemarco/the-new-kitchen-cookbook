#!/bin/zsh

#usage: ./tag.sh
#requires gnu-sed on macos

#To list tags:   
ag --nofilename -o "\[.*\]:" */*.md | sort | uniq | sed 's/.//;s/..$//;/^[[:space:]]*$/d' > tags.txt
sleep 2

#To find files
while IFS= read -r line; do
    echo "@- tagname: $line";
    fline=`echo $line | gsed -E 's/[ _-]([a-z])/\U\1/gi;s/^([A-Z])/\l\1/'`
    echo "@  filename: $fline";
    echo "@  paths:";
    edline="\[$line\]:"
#echo "${edline}"
    grep -l "$edline" */*.md
done < tags.txt > tags.temp

#To fix yaml
sed 's/^\([^@]\)/  - \1/g;s/@//g' tags.temp > _contents/tags.yaml

rm tags.temp tags.txt

