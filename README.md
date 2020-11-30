## Create custom kraken database

Bash script to create a custom kraken library/database and to classify reads by taxonomy.

## Requirements

1) kraken v2.0.8

## How to run

```
bash scripts/create_custom_kraken_db.sh /path/to/genome.fasta organismTaxid outputfoldername
bash scripts/kraken_reads_classify.sh /path/to/dbname R1.fastq R2.fasta outputfilename classify#.fastq unclassified#.fastq
```

