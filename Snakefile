configfile: "config/config.yml"

rule all:
    input:
        expand("results/Prodigal/{sample}_prot.faa", sample=config["samples"]),
        expand("results/HMMER/{sample}_pvog.log", sample=config["samples"]),
        expand("results/HMMER/{sample}_VPF.log", sample=config["samples"]),
        expand("results/BLAST_PhiX/{sample}_phix.txt", sample=config["samples"]),

##### workflow starts here

rule Prodigal:
    input:
        f="inputs/{base}_phages_selection1.fna",
    params:
        outdir= "results/Prodigal",
        gff="results/Prodigal/{base}_genes.gff",
        genes="results/Prodigal/{base}_genes.fna",
    output:
        "results/Prodigal/{base}_prot.faa",
    shell:
        """
        set +eu
        source activate viral_confirm
        prodigal -i {input.f} -o {params.gff} -f gff -a {output} -d {params.genes} -p meta
        """

rule pVOG:
    input:
        f="results/Prodigal/{base}_prot.faa",
    params:
        outdir= "results/Prodigal",
        HmmDB="databases/vog_db_30_01_20",
    output:
        "results/HMMER/{base}_pvog.log",
    shell:
        """
        set +eu
        source activate viral_confirm
        hmmscan --cpu 10 --tblout {output} {params.HmmDB} {input.f}
        """

rule pVF:
    input:
        f="results/Prodigal/{base}_prot.faa",
    params:
        outdir= "results/Prodigal",
        HmmDB="databases/VPF_list",
    output:
        "results/HMMER/{base}_VPF.log",
    shell:
        """
        set +eu
        source activate viral_confirm
        hmmscan --cpu 10 --tblout {output} {params.HmmDB} {input.f}
        """

rule blast:
    input:
        f="inputs/{base}_phages_selection1.fna",
    params:
        outdir="results/BLAST_PhiX",
        BLASTDB="scripts/blast_Phix/phix.fasta"
    output:
        "results/BLAST_PhiX/{base}_phix.txt",
    shell:
        """
        set +eu
        source activate viral_confirm
        blastn -db {params.BLASTDB} -query {input.f} -out {output} -evalue 0.01 -outfmt 6
        """






