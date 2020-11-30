#!/bin/bash
# taxonomic classification of raw reads using kraken

# usage: bash scripts/kraken_reads_classify.s /tsl/data/krakendb/standard_pluspfp R1.fastq R2.fastq outputfilename classified#.fastq unclassified#.fastq
source kraken2-2.0.8

db=$1
R1=$2
R2=$3
output=$4
classified=$5
unclassified=$6

kraken2 --db $db --threads 6 --paired --gzip-compressed --output $output --classified-out ${classified}_#.fastq --unclassified-out ${unclassified}_#.fastq --minimum-base-quality 20 $R1 $R2
