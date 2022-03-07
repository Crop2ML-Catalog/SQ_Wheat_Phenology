import numpy 
from math import *
from datetime import datetime

def model_updateleafflag(float cumulTT=741.510096671757,
                         float leafNumber=8.919453833361189,
                         list calendarMoments=['Sowing'],
                         list calendarDates=[datetime(2007, 3, 21) ,],
                         list calendarCumuls=[0.0],
                         datetime currentdate=datetime(2007, 4, 29) ,
                         float finalLeafNumber=8.797582013199484,
                         int hasFlagLeafLiguleAppeared_t1=1,
                         float phase=1.0):
    """

    UpdateLeafFlag Model
    Author: Peter D. Jamieson, Glen S. Francis, Derick R. Wilson, Robert J. Martin
    Reference: https://doi.org/10.1016/0168-1923(94)02214-5
    Institution: New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.,
            New Zealand Institute for Crop and Food Research Ltd.
        
    ExtendedDescription: tells if flag leaf has appeared and update the calendar if so
    	
    ShortDescription: tells if flag leaf has appeared and update the calendar if so

    """
    cdef int hasFlagLeafLiguleAppeared
    hasFlagLeafLiguleAppeared=0
    if (phase >= 1.0 and phase< 4.0):
        if (leafNumber > 0.0):
            if (hasFlagLeafLiguleAppeared == 0 and (finalLeafNumber > 0.0 and leafNumber >= finalLeafNumber)):
                hasFlagLeafLiguleAppeared = 1
                if  "FlagLeafLiguleJustVisible" not in calendarMoments:
                    calendarMoments.append("FlagLeafLiguleJustVisible")
                    calendarCumuls.append(cumulTT)
                    calendarDates.append(currentdate)
    return  hasFlagLeafLiguleAppeared, calendarMoments, calendarDates, calendarCumuls
