# QC FastQ files in FastQC
module load fastqc-0.11.8-gcc-5.4.0-jrkefu2

cd /rds/user/jm2294/rds-jmmh2-projects/interval_rna_seq/dge_test
mkdir fastqc

fastqc *.fastq -o fastqc
