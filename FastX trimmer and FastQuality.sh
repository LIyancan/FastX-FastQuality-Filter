#!/bin/bash
#SBATCH -A b2014097
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 120:00:00
#SBATCH -J FastXTrimmer-FastQuality
#SBATCH -o /proj/b2014097/nobackup/Niyaz/logs/trim.out
#SBATCH -e /proj/b2014097/nobackup/Niyaz/logs/trim.err


module load bioinfo-tools 
module load Fastx/0.0.14

echo "trimming"

for x in *.gz; do

        file_input="$x"
        file_out="$x"'s'
        gunzip -c  $file_input | fastx_trimmer -Q33 -f 15 -l 95 | fastq_quality_filter -Q 33 -q 30 -p 85 -z -o $file_out
done;

echo "done"

## 
