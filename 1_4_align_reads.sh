#!/bin/bash
#SBATCH -A PAUL-SL3-CPU
#SBATCH -p skylake
#SBATCH --mem 20G
#SBATCH -n6
#SBATCH --job-name=genomeindex
#SBATCH --time=12:0:0
#SBATCH --output=/rds/user/jm2294/rds-jmmh2-projects/interval_rna_seq/dge_test/logs/dge_test_makegenomeindex_%A_%a.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jm2294@medschl.cam.ac.uk

FASTQ_FILE=$(head scripts/fastq_filelist.txt -n $SLURM_ARRAY_TASK_ID | tail -n 1)

module load star/2.5.0a
cd /rds/user/jm2294/rds-jmmh2-projects/interval_rna_seq/dge_test

STAR\
 --genomeDir genome_index\
 --runThreadN 6\
 --readFilesIn FASTQ_files/${FASTQ_FILE}\
 --outFileNamePrefix aligned/dge_test_\
 --outSAMtype BAM SortedByCoordinate\
 --outSAMunmapped Within\
 --outSAMattributes Standard 