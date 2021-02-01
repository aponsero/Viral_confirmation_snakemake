#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=2:mem=10gb
#PBS -l walltime=12:00:00
#PBS -M aponsero@email.arizona.edu
#PBS -m bea

source activate viral_env

cd /xdisk/bhurwitz/mig2020/rsgrps/bhurwitz/alise/my_scripts/Viral_confirmation_snakemake

#dry run
#snakemake -n

#run in cluster
snakemake --cluster "qsub -N test_snake -W group_list=bhurwitz -q {cluster.queue} -l {cluster.walltime} -l {cluster.select}" --cluster-config config/cluster.yaml -j 3

#snakemake --cluster "qsub -N test_snake -W group_list=bhurwitz -q standard -l walltime=02:00:00 -l select=1:ncpus=12:mem=100gb" --cluster-config config/cluster.yaml -j 10
