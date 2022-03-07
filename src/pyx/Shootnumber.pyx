import numpy 
from math import *
def model_shootnumber(float canopyShootNumber_t1=288.0,
                      float leafNumber=3.34,
                      float sowingDensity=288.0,
                      float targetFertileShoot=600.0,
                      list tilleringProfile_t1=[288.0],
                      list leafTillerNumberArray_t1=[1, 1, 1],
                      int numberTillerCohort_t1=1):
    """

    CalculateShootNumber Model
    Author: Peter D. Jamieson, Glen S. Francis, Derick R. Wilson, Robert J. Martin
    Reference: https://doi.org/10.1016/0168-1923(94)02214-5
    Institution: New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.
        
    ExtendedDescription: calculate the shoot number and update the related variables if needed
    ShortDescription: calculate the shoot number and update the related variables if needed

    """
    cdef float averageShootNumberPerPlant
    cdef float canopyShootNumber
    cdef intlist leafTillerNumberArray
    cdef floatlist tilleringProfile
    cdef int numberTillerCohort
    cdef int emergedLeaves, shoots, i
    cdef intlist lNumberArray_rate
    emergedLeaves = max(1, ceil(leafNumber - 1.0))
    shoots = fibonacci(emergedLeaves)
    canopyShootNumber = min(shoots * sowingDensity, targetFertileShoot)
    averageShootNumberPerPlant = canopyShootNumber / sowingDensity
    if (canopyShootNumber != canopyShootNumber_t1):
        tilleringProfile = integr(tilleringProfile_t1,canopyShootNumber - canopyShootNumber_t1)
    numberTillerCohort = len(tilleringProfile)
    for i in range(len(leafTillerNumberArray_t1),ceil(leafNumber),1):
        lNumberArray_rate.append(numberTillerCohort)
    leafTillerNumberArray = integr(leafTillerNumberArray_t1, lNumberArray_rate)
    return  averageShootNumberPerPlant, canopyShootNumber, leafTillerNumberArray, tilleringProfile, numberTillerCohort
def fibonacci(int n):
    if n<=1: return n
    else: return fibonacci(n-1)+fibonacci(n-2)
def init_shootnumber(float sowingDensity=288.0,
                     float targetFertileShoot=600.0):
    cdef float canopyShootNumber_t1
    cdef float leafNumber
    cdef floatlist tilleringProfile_t1
    cdef intlist leafTillerNumberArray_t1
    cdef int numberTillerCohort_t1
    cdef float averageShootNumberPerPlant
    cdef float canopyShootNumber
    cdef intlist leafTillerNumberArray
    cdef floatlist tilleringProfile
    cdef int numberTillerCohort
    canopyShootNumber = sowingDensity
    averageShootNumberPerPlant = 1.0
    tilleringProfile.append(sowingDensity)
    numberTillerCohort = 1
    leafTillerNumberArray = []
    return  averageShootNumberPerPlant, canopyShootNumber, leafTillerNumberArray, tilleringProfile, numberTillerCohort
