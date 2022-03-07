import numpy 
from math import *
def model_phylsowingdatecorrection(int sowingDay=1,
                                   float latitude=0.0,
                                   float sDsa_sh=1.0,
                                   float rp=0.0,
                                   int sDws=1,
                                   float sDsa_nh=1.0,
                                   float p=120.0):
    """

    PhylSowingDateCorrection Model
    Author: Peter D. Jamieson, Glen S. Francis, Derick R. Wilson, Robert J. Martin
    Reference: https://doi.org/10.1016/0168-1923(94)02214-5
    Institution: New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.
        
    ExtendedDescription: Correction of the Phyllochron Varietal parameter according to sowing date 
    ShortDescription: Correction of the Phyllochron Varietal parameter according to sowing date 

    """
    cdef float fixPhyll
    if (latitude < 0.0):
        if (sowingDay > int(sDsa_sh)):
            fixPhyll = p * (1 - rp * min(sowingDay - sDsa_sh, sDws))
        else:
            fixPhyll = p
    else:
        if (sowingDay < int(sDsa_nh)):
            fixPhyll = p * (1 - rp * min(sowingDay, sDws))
        else:
            fixPhyll = p
    return  fixPhyll
