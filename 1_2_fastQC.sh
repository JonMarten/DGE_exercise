# QC FastQ files in FastQC
module load fastqc-0.11.8-gcc-5.4.0-jrkefu2

cd /rds/user/jm2294/rds-jmmh2-projects/interval_rna_seq/dge_test
mkdir fastqc

fastqc *.fastq -o fastqc

# SRR5223570 shows overrepresentation of Illumina Single End PCR Primer 1 
module load python/2.7.10
module load cutadapt/1.8.1
cutadapt --adapter=AGGCGAAGACACTCTTTCCCTACACGACGCTCTTCCGATCGATCGGAAGA --minimum-length=25 -o SRR5223570_trimmed.fastq SRR5223570.fastq