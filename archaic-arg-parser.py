import sys
#extracting a tab delimited file of archaic alleles from a vcf file
def get_relevant_alleles(info):
    #make a dictionary of archaic alleles
    #dictionary keys are chroms and positions
    archaic_info = {}
    for line in open(info):
        a = line.strip().split('\t')
        chrom = a[0]
        pos = a[1]
        allele = a[2]
        hominin = a[4]
        temp_key = (chrom,pos)
        value_field = [allele,hominin]
        if temp_key in archaic_info:
            archaic_info[temp_key].append(value_field)
        else:
            archaic_info[temp_key] = [value_field]
    return archaic_info

def make_variant_list(vcf,archaic_info):
    variant_list = []
    for line in vcf:
        if line.startswith('#') == False:
            a = line.strip().split('\t')
            chrom = a[0]
            pos = a[1]
            ref = a[3]
            alt = a[4]

            sample_info = a[9]
            sample_alleles = []
            key =(chrom,pos)
        #iterating only through reads in the archaic alleles file so my search will be limited to biallelic SNPs
            if key in archaic_info:
                genotype = sample_info.split(':')[0]
                if genotype[1] == '|':
                    if genotype.split('|')[0] is '0':
                        allele_1 = ref
                    if genotype.split('|')[0] is '1':
                        allele_1 = alt
                    if genotype.split('|')[1] is '0':
                        allele_2 = ref
                    if genotype.split('|')[1] is '1':
                        allele_2 = alt
                elif genotype[1] == '/':
                    if genotype.split('/')[0] is '0':
                        allele_1 = ref
                    if genotype.split('/')[0] is '1':
                        allele_1 = alt
                    if genotype.split('/')[1] is '0':
                        allele_2 = ref
                    if genotype.split('/')[1] is '1':
                        allele_2 = alt
                if allele_1 is allele_2:
                    GT = 'hom'
                else:
                    GT = 'het'
                sample_alleles = [allele_1, allele_2]
                for item in archaic_info[key]:
                    if item[0] == sample_alleles[0] or item[0] == sample_alleles[1]:
                        value_field = [chrom,pos,item[0],item[1],GT]
                        variant_list.append(value_field)
    return variant_list

def make_input_bed(variant_list):
    bed_info = []
    for a in variant_list:
        chrom = a[0]
        start0 = int(a[1]) - 1
        start = str(start0)
        end = a[1]
        allele = a[2]
        hominin = a[3]
        GT = a[4]
        description = allele + ',' + hominin + ',' + GT
        value_field = [chrom,start,end,description]
        bed_info.append(value_field)
    return bed_info


def main():
    info = sys.argv[1]
    vcf = sys.stdin
    archaic_info = get_relevant_alleles(info)
    variant_list = make_variant_list(vcf,archaic_info)
    bed_info = make_input_bed(variant_list)
    for item in bed_info:
        print(item[0] + '\t' +item[1] + '\t' + item[2] + '\t' + item[3])


if __name__ == "__main__":
    main()

