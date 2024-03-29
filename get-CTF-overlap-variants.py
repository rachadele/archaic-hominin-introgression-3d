#filter CTCF overlap regions containing archaic variants
import sys
import itertools
def get_variants(filtered_matrix, variant_dict):
    new_matrix = {}
    with open(filtered_matrix) as f:
        for line1,line2 in itertools.zip_longest(*[f]*2):
            CTCFs = line2.strip().split('\t')
            cool = line1.strip().split('\t') 
            chrom = cool[0]
            hit = bool
            for i in range(0,len(CTCFs)-1,4):
                start1 = int(CTCFs[i])
                end1 = int(CTCFs[i+1])
                start2 = int(CTCFs[i+2])
                end2 = int(CTCFs[i+3])
                hit = False
                if str('chr'+chrom) in variant_dict.keys():
                    for variant in variant_dict[str('chr'+chrom)]:
                        if start1 < int(variant[0]) < int(variant[1]) < end1:
                            key = line1
                            value_field = start1,end1,int(variant[0])
                            if key not in new_matrix:
                                new_matrix[key] = []
                            new_matrix[key].append(value_field)
                        if start2 < int(variant[0]) < int(variant[1]) < end2:
                            key = line1
                            value_field = start2,end2,int(variant[0])
                            if key not in new_matrix:
                                new_matrix[key] = []
                            new_matrix[key].append(value_field)
    return new_matrix

def make_variants_dict(variant_file):
    variant_dict = {}
    for a in open(variant_file):
        line = a.strip().split('\t')
        chrom = line[0]

        start = line[1]
        end = line[2]
        info = line[3]
        temp_key = chrom
        value_field = start,end

        if temp_key not  in variant_dict:
            variant_dict[temp_key] = []
        variant_dict[temp_key].append(value_field)

    return variant_dict

def main():
    filtered_matrix = sys.argv[1]
    variant_file = sys.argv[2]
    variant_dict = make_variants_dict(variant_file)
    new_matrix = get_variants(filtered_matrix, variant_dict)
    for key,values in new_matrix.items():
        print(key,'\t'.join(str(elem) for elem in values))

if __name__ == "__main__":
    main()
