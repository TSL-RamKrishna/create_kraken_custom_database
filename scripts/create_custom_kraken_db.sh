#!/bin/bash

source kraken-2.0.8

genome=$1      # genome/assembly sequence to add to kraken database/library
taxid=$2       # taxid of the organism in the genome/assembly
dbname=$3      # kraken database name/output folder


## this step requires taxid to be added to the fasta sequence ids.
## I used this command to add the taxids

krakengenome=$(echo $genome | sed 's/.fasta$/_kraken.fasta/;s/.fa$/_kraken.fa/')
awk -v taxid=$taxid '{if($1 ~ /^>/){print $1"|kraken:taxid|"taxid"\t"$2} else {print}}'  $genome  > ${krakengenome}  #this will generate a new genome filename ending with _kraken.fasta

## Now add to database
kraken2-build --add-to-library $genome --db $dbname

## kraken2 complains these two files to be present, though emtpy, so just use touch command
mkdir ${dbname}/taxonomy
touch ${dbname}/taxonomy/nodes.dmp
touch ${dbname}/taxonomy/names.dmp

## build kraken db
kraken2-build --build --db ${dbname}

