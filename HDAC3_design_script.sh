grep -e HDAC3 metadata.tsv | grep -e fastq > design.txt
#get only the HDAC3 rows from metadata file
( awk -F "\t" '{OFS = ","} NR==1{print $19, $31, $36, $43, $47}' metadata.tsv;
awk -F "\t" '{OFS = ","}{print $19, $31, $36, $43, $47}' design.txt ) > design2.csv
#select the headers and columns that we need from the new HDAC3 file and put them in a csv file

###might be a more graceful way to do this next part with grep, but I'm not sure how

( awk -F "," '{OFS = ","} NR==1{print $1, $2, $3, $4, $5}' design2.csv;
awk -F "," '{OFS = ","} $3=="1"{print $1, $2, $3, $4, $5}' design2.csv ) > design2_1.csv
#take only rows for replicate 1 out of the clean hdac3 file and into new file
( awk -F "," '{OFS = ","} NR==1{print $1, $2, $3, $4, $5}' design2.csv;
awk -F "," '{OFS = ","} $3=="2"{print $1, $2, $3, $4, $5}' design2.csv ) > design2_2.csv
#take only rows for replicate 2 out of clean file into new file


paste -d "," design2_1.csv design2_2.csv > design3.csv
#join the files so that replicate 2 is following replicate 1 in the same row
awk -F "," '{OFS = ","}{print $1, $2, $4, $9, $6, $5, $10}' design3.csv > design4.csv
#get rid of some of the columns that aren't needed in the joined file

###still need to change headers...also not sure how to get controls underneath samples.
