
#!/bin/bash

echo "enter individual's genome ID"

read $ID

echo "enter sex"

read $sex

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt > $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr13.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed vcftools --gzvcf 

Vcftools -gzvcf /scratch1/rachel/vcf/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr20.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

vcftools --gzvcf /scratch1/rachel/vcf/ALL.chrX.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

if $sex != 'female':

  vcftools --gzvcf /scratch1/rachel/vcf/ALL.chrY.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --stdout --indv $ID --recode | python /scratch1/rachel/archaic.arg.parser.v2.py /scratch1/rachel/archaic_alleles_all.txt >> $out.variants.bed 

