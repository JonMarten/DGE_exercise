#!/bin/bash
#SBATCH -A PAUL-SL3-CPU
#SBATCH -p skylake
#SBATCH --mem 100G
#SBATCH -n6
#SBATCH --job-name=genomeindex
#SBATCH --time=12:0:0
#SBATCH --output=/rds/user/jm2294/rds-jmmh2-projects/interval_rna_seq/dge_test/logs/dge_test_makegenomeindex_%A_%a.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jm2294@medschl.cam.ac.uk

FASTQ_FILE=$(head scripts/fastq_filelist.txt -n $SLURM_ARRAY_TASK_ID | tail -n 1)

module load star/2.5.0a
cd /rds/user/jm2294/rds-jmmh2-projects/interval_rna_seq/dge_test

# Unnecessary to index fasta file, already indexed on cluster
STAR --runThreadN 6\
 --runMode genomeGenerate\
 --genomeDir genome_index\
 --genomeFastaFiles /home/jm2294/rds/rds-jmmh2-public_databases/GRCh37_reference_fasta/hs37d5.fa\
 --sjdbGTFfile reference/Homo_sapiens.GRCh37.87.gtf.gz\
 --sjdbOverhang 149
 