# Viral_confirmation_snakemake
Snakemake pipeline to confirm the viral origin of selected sequences



## Installation

### Create a conda environment 
Use the recipe in this repository (environment.yml) to create a conda environment for the pipeline

```
conda env create -f environment.yml
```

### Download the HMM profiles
Download the KoFAM KEGG HMM collection from [here](https://www.genome.jp/tools/kofamkoala/) in a folder called Databases. 
Update the Snakemake file to match the collection's name.

### download profiles from PVF
Download the VPF HMM collection from [JGI IMG](https://img.jgi.doe.gov/cgi-bin/vr/main.cgi) in a folder called Databases. 
Update the Snakemake file to match the collection's name.

### download profiles from pVOGs
Download the pVOG HMM collection from [here](http://dmk-brain.ecn.uiowa.edu/pVOGs/) in a folder called Databases. 
Update the Snakemake file to match the collection's name.

## Run
Add in the config.yml the samples names to process.
The pipeline takes as an imput the selection of potential viral contigs as a fasta and a coverage file



