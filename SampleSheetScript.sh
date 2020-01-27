#!/bin/bash
grep -e HDAC3 metadata.tsv | grep -e fastq > hdac3.txt
awk -F "\t" '{OFS = ","}{print $1, $4, $31, $37, $41, $43, $47}' hdac3.txt > hdac3_clean.csv
awk -F "," '{print $6}' hdac3_clean.csv > hdacx_urls.txt
