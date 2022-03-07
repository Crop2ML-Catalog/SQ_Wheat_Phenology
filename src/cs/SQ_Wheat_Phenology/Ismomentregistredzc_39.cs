using System;
using System.Collections.Generic;
using System.Linq;
public class IsMomentRegistredZC_39
{
    
    public IsMomentRegistredZC_39() { }
    
    public void  CalculateModel(PhenologyState s, PhenologyState s1, PhenologyRate r, PhenologyAuxiliary a, PhenologyExogenous ex)
    {
        //- Name: IsMomentRegistredZC_39 -Version: 1.0, -Time step: 1
        //- Description:
    //            * Title: Is FlagLeafLiguleJustVisible Model
    //            * Author: Peter D. Jamieson, Glen S. Francis, Derick R. Wilson, Robert J. Martin
    //            * Reference: https://doi.org/10.1016/0168-1923(94)02214-5
    //            * Institution: New Zealand Institute for Crop and Food Research Ltd.,
    //            New Zealand Institute for Crop and Food Research Ltd.,
    //            New Zealand Institute for Crop and Food Research Ltd.,
    //            New Zealand Institute for Crop and Food Research Ltd.
    //        
    //            * ExtendedDescription: if FlagLeafLiguleJustVisible is already Registred 
    //            * ShortDescription: if FlagLeafLiguleJustVisible is already Registred 
        //- inputs:
    //            * name: calendarMoments_t1
    //                          ** description : List containing appearance of each stage at previous time
    //                          ** variablecategory : state
    //                          ** datatype : STRINGLIST
    //                          ** default : ['Sowing']
    //                          ** unit : 
    //                          ** inputtype : variable
        //- outputs:
    //            * name: isMomentRegistredZC_39
    //                          ** description :  if Flag leaf ligule has already appeared 
    //                          ** variablecategory : state
    //                          ** datatype : INT
    //                          ** min : 0
    //                          ** max : 1
    //                          ** unit : 
        List<string> calendarMoments_t1 = s1.calendarMoments;
        int isMomentRegistredZC_39;
        isMomentRegistredZC_39 = calendarMoments_t1.Contains("FlagLeafLiguleJustVisible") ? 1 : 0;
        s.isMomentRegistredZC_39= isMomentRegistredZC_39;
    }
}