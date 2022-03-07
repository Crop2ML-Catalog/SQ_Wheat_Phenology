using System;
using System.Collections.Generic;
using System.Linq;
public class GAImean
{
    private double _tTWindowForPTQ;
    public double tTWindowForPTQ
        {
            get { return this._tTWindowForPTQ; }
            set { this._tTWindowForPTQ= value; } 
        }
    public GAImean() { }
    
    public void  CalculateModel(PhenologyState s, PhenologyState s1, PhenologyRate r, PhenologyAuxiliary a, PhenologyExogenous ex)
    {
        //- Name: GAImean -Version: 1.0, -Time step: 1
        //- Description:
    //            * Title: Average GAI on a specific thermal time window
    //            * Author: Peter D. Jamieson, Glen S. Francis, Derick R. Wilson, Robert J. Martin
    //            * Reference: https://doi.org/10.1016/0168-1923(94)02214-5
    //            * Institution: New Zealand Institute for Crop and Food Research Ltd.,
    //            New Zealand Institute for Crop and Food Research Ltd.,
    //            New Zealand Institute for Crop and Food Research Ltd.,
    //            New Zealand Institute for Crop and Food Research Ltd.
    //        
    //            * ExtendedDescription: Calculate GAI mean
    //            * ShortDescription: Calculate GAI mean
        //- inputs:
    //            * name: gAI
    //                          ** description : Green Area Index of the day
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
    //            * name: tTWindowForPTQ
    //                          ** description : Thermal Time window for average
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: deltaTT
    //                          ** description : Thermal time increase of the day
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 100.0
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: pastMaxAI_t1
    //                          ** description : Maximum Leaf Area Index reached the current day
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
    //            * name: listTTShootWindowForPTQ1_t1
    //                          ** description : List of daily shoot thermal time in the window dedicated to average
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** default : [0.0]
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: listGAITTWindowForPTQ_t1
    //                          ** description : List of daily Green Area Index in the window dedicated to average
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** default : [0.0]
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
        //- outputs:
    //            * name: gAImean
    //                          ** description : Mean Green Area Index
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
    //            * name: pastMaxAI
    //                          ** description : Maximum Leaf Area Index reached the current day
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
    //            * name: listTTShootWindowForPTQ1
    //                          ** description : List of daily shoot thermal time in the window dedicated to average
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: listGAITTWindowForPTQ
    //                          ** description : List of daily Green Area Index in the window dedicated to average
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
        double gAI = a.gAI;
        double deltaTT = a.deltaTT;
        double pastMaxAI_t1 = s1.pastMaxAI;
        List<double> listTTShootWindowForPTQ1_t1 = s1.listTTShootWindowForPTQ1;
        List<double> listGAITTWindowForPTQ_t1 = s1.listGAITTWindowForPTQ;
        double gAImean;
        double pastMaxAI;
        List<double> listTTShootWindowForPTQ1 = new List<double>();
        List<double> listGAITTWindowForPTQ = new List<double>();
        List<double> TTList = new List<double>();
        List<double> GAIList = new List<double>();
        double SumTT;
        int count = 0;
        double gai_ = 0.0d;
        double gaiMean_ = 0.0d;
        int countGaiMean = 0;
        int i;
        for (i=0 ; i!=listTTShootWindowForPTQ1_t1.Count ; i+=1)
        {
            TTList.Add(listTTShootWindowForPTQ1_t1[i]);
            GAIList.Add(listGAITTWindowForPTQ_t1[i]);
        }
        TTList.Add(deltaTT);
        GAIList.Add(gAI);
        SumTT = TTList.Sum();
        while ( SumTT > tTWindowForPTQ)
        {
            SumTT = SumTT - TTList[count];
            count = count + 1;
        }
        for (i=count ; i!=TTList.Count ; i+=1)
        {
            listTTShootWindowForPTQ1.Add(TTList[i]);
            listGAITTWindowForPTQ.Add(GAIList[i]);
        }
        for (i=0 ; i!=listGAITTWindowForPTQ.Count ; i+=1)
        {
            gaiMean_ = gaiMean_ + listGAITTWindowForPTQ[i];
            countGaiMean = countGaiMean + 1;
        }
        gaiMean_ = gaiMean_ / countGaiMean;
        gai_ = Math.Max(pastMaxAI_t1, gaiMean_);
        pastMaxAI = gai_;
        gAImean = gai_;
        s.gAImean= gAImean;
        s.pastMaxAI= pastMaxAI;
        s.listTTShootWindowForPTQ1= listTTShootWindowForPTQ1;
        s.listGAITTWindowForPTQ= listGAITTWindowForPTQ;
    }
}