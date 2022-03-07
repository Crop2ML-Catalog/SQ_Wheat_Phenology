import numpy 
from math import *
def model_leafnumber(float deltaTT=23.5895677277199,
                     float phyllochron_t1=0.0,
                     int hasFlagLeafLiguleAppeared=0,
                     float leafNumber_t1=0.0,
                     float phase=1.0):
    """

    CalculateLeafNumber Model
    Author: Peter D. Jamieson, Glen S. Francis, Derick R. Wilson, Robert J. Martin
    Reference: https://doi.org/10.1016/0168-1923(94)02214-5
    Institution: New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.
        
    ExtendedDescription: calculate leaf number. LeafNumber increase is caped at one more leaf per day
    ShortDescription: calculate leaf number. LeafNumber increase is caped at one more leaf per day

    """
    cdef float leafNumber
    leafNumber = leafNumber_t1
    cdef float phyllochron_
    if (phase >= 1.0 and phase< 4.0):
        if (hasFlagLeafLiguleAppeared==0):
            if (phyllochron_t1 == 0.0):
                phyllochron_ = 0.0000001
            else: phyllochron_ = phyllochron_t1
            leafNumber = leafNumber_t1 + min(deltaTT / phyllochron_, 0.999)
    return  leafNumber
