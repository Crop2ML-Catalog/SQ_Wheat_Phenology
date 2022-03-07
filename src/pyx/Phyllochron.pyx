import numpy 
from math import *
def model_phyllochron(float fixPhyll=5.0,
                      float leafNumber=0.0,
                      float lincr=8.0,
                      float ldecr=0.0,
                      float pdecr=0.4,
                      float pincr=1.5,
                      float ptq=0.0,
                      float gAImean=0.0,
                      float kl=0.45,
                      float pTQhf=0.0,
                      float B=20.0,
                      float p=120.0,
                      str choosePhyllUse='Default',
                      float areaSL=0.0,
                      float areaSS=0.0,
                      float lARmin=0.0,
                      float lARmax=0.0,
                      float sowingDensity=0.0,
                      float lNeff=0.0):
    """

    Phyllochron Model
    Author: Peter D. Jamieson, Glen S. Francis, Derick R. Wilson, Robert J. Martin
    Reference: https://doi.org/10.1016/0168-1923(94)02214-5
    Institution: New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.
        
    ExtendedDescription: Calculate different types of phyllochron 
    ShortDescription: Calculate different types of phyllochron 

    """
    cdef float phyllochron
    cdef float gaiLim
    cdef float LAR
    phyllochron=0.0
    LAR=0.0
    gaiLim=lNeff * ((areaSL + areaSS)/10000.0) * sowingDensity
    if choosePhyllUse =="Default":
        if (leafNumber < ldecr):
            phyllochron = fixPhyll * pdecr
        elif (leafNumber >= ldecr and leafNumber < lincr):
            phyllochron = fixPhyll
        else:
            phyllochron = fixPhyll * pincr
    if choosePhyllUse =="PTQ":
        if (gAImean > gaiLim):
            LAR = (lARmin + (((lARmax-lARmin) * ptq) / (pTQhf + ptq))) / (B * gAImean);
        else:
            LAR = (lARmin + (((lARmax - lARmin) * ptq) / (pTQhf + ptq))) / (B * gaiLim)     
        phyllochron=1.0/LAR
    if choosePhyllUse == "Test":
        if (leafNumber < ldecr):
            phyllochron = p * pdecr
        elif (leafNumber >= ldecr and leafNumber < lincr):
            phyllochron = p
        else:
            phyllochron = p * pincr
    return  phyllochron
