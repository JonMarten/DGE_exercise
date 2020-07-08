cd ~/bin

wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.10.8/sratoolkit.2.10.8-ubuntu64.tar.gz
tar xvzf sratoolkit.2.10.8-ubuntu64.tar.gz
export PATH=$PATH:/home/jm2294/bin/sratoolkit.2.10.8-ubuntu64/bin

mkdir /rds/user/jm2294/rds-jmmh2-projects/interval_rna_seq/dge_test

vdb-config -i

cd ~/dge_exercise

# untreated
prefetch SRR5223500
prefetch SRR5223522
prefetch SRR5223543
# treatedSRA
prefetch SRR5223505
prefetch SRR5223547
prefetch SRR5223570

# Convert all .sra files to .fastq
fastq-dump SR*/*.sra