import numpy 
from math import *
def model_ismomentregistredzc_39(list calendarMoments_t1=['Sowing']):
    """

    Is FlagLeafLiguleJustVisible Model
    Author: Peter D. Jamieson, Glen S. Francis, Derick R. Wilson, Robert J. Martin
    Reference: https://doi.org/10.1016/0168-1923(94)02214-5
    Institution: New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.
        
    ExtendedDescription: if FlagLeafLiguleJustVisible is already Registred 
    ShortDescription: if FlagLeafLiguleJustVisible is already Registred 

    """
    cdef int isMomentRegistredZC_39
    isMomentRegistredZC_39 = 1 if "FlagLeafLiguleJustVisible" in calendarMoments_t1 else 0
    return  isMomentRegistredZC_39
