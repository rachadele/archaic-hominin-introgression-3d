import sys
#cool-parser.py
#takes annotated cooler matrix in txt format and returns regions along the diagonal with CTCF motifs on both x and y-axis bins
#also returns list of CTCF domains within each bin 
#can take thee difference between to matrices as input, so that the "count" column for eeach matrix entry is the difference between two matricees
#the diff method can be used to compare bins with/without variants
def get_relevant_regions(matrix,CTCF_dict): 
#create dictionary to return valid regions/CTCF motifs
    matrix_dict = {}
    #filter regions for bin distance and CTCF sites in both bins
    for entry in matrix:
        line = entry.strip().split('\t')
        chrom1 = line[0]
        start1 = int(line[1])
        end1 = int(line[2])
        chrom2 = line[3]
        start2 = int(line[4])
        end2 = int(line[5])
        if chrom1 in CTCF_dict.keys() and chrom2 in CTCF_dict.keys():
            #filter out contigs
            if chrom1==chrom2:
               # limits regions to same chromosome, may be changed later (I kept it this way for convenience)
                if 0 < abs(start1 - start2) < 5000000:
                #restrict search to non-self squares within 500 bins (5 million bp) of one another
                #can be made larger/smaller as necessary
                    for domain1 in CTCF_dict[chrom1]:
                        #searches domains in motif dictionary for x-axis chromosome
                        if start1 < domain1[0] < domain1[1] < end1:
                            #returns True if there is a CTCF motif in x bin
                            #proceeds to search for y-axis
                            #since all chroms are the same in this version, looks through motifs starting from the top of the list
                            #can't use the same for loop because non-self bins are eliminated, meaning domains shouldn't be the same
                            for domain2 in CTCF_dict[chrom2]:
                                if start2 < domain2[0] < domain2[1] < end2:
                                    #returns true if there's a motif in the y-axis bin
                                    temp_key = entry
                                    value_field = [domain1,domain2]
                                    if temp_key in matrix_dict:
                                        matrix_dict[temp_key].append(value_field)
                                    else:
                                        matrix_dict[temp_key] = []
                                        matrix_dict[temp_key].append(value_field)
                                        #this method is verey redundant as there can be many CTCF motifs within 10kb intervals
                                        #I tried to account for this by appending all hits to a dictionary
    return matrix_dict    

def make_CTCF_dict(CTCF):
    #make CTCF domain file (from human genomee browser) into a dictionary 
    CTCF_dict = {}
    for item in open(CTCF):
            a = item.strip().split('\t')
            chrom = (a[0])
            start = int(a[1])
            end = int(a[2])
            value_field = [start,end]
            if chrom in CTCF_dict:
                CTCF_dict[chrom].append(value_field)
            else:
                CTCF_dict[chrom] = [value_field]
    return CTCF_dict
            
def flattenNestedList(nestedList):
    ''' Converts a nested list to a flat list '''
    flatList = []
    # Iterate over all the elements in given list
    for elem in nestedList:
        # Check if type of element is list
        if isinstance(elem, list):
            # Extend the flat list by adding contents of this element (list)
            flatList.extend(flattenNestedList(elem))
        else:
            # Append the elemengt to the list
            flatList.append(elem)    
 
    return flatList

def main():
    CTCF = sys.argv[1]
    matrix = sys.stdin
    CTCF_dict = make_CTCF_dict(CTCF)
    matrix_dict = get_relevant_regions(matrix,CTCF_dict)
    for key,value in matrix_dict.items():
        #for entry in matrix_dict.keys():
        #domains = '\t'.join(str(elem) for elem in matrix_dict[entry]) #[str(elem) for elem in
        domains = flattenNestedList(value) 
        output = str(key + '\t'+ '\t'.join(str(elem) for elem in domains))
        print(output)
       # print(key, end = '\t')
       # print('\t'.join(str(a) for a in domains))

if __name__ == "__main__":
    main()
