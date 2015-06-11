#!/bin/bash

rm a.txt
for ((i=1;i<=100;i++));
do
    echo  "https://www.retsinformation.dk/Forms/R0210.aspx?sort=1&page="$i
    curl "https://www.retsinformation.dk/Forms/R0210.aspx?sort=1&page="$i | grep "Forms/R07" | grep "id=[0-9]*" -o | grep "[0-9]*" -o >> a.txt
done

rm b.txt
cat a.txt | uniq | sort >> b.txt

while read p; do
    wkhtmltopdf "https://www.retsinformation.dk/Forms/R0710.aspx?id="$p $p
done <b.txt
