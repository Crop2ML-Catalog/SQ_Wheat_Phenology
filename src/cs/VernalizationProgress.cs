
if (IsVernalizable==1 && Vernaprog < 1)
{
	double TT = DeltaTT; // other sirius versions use previous temperature value

	if (TT >= MinTvern && TT <= IntTvern)
	{
		Vernaprog = Vernaprog + VAI * TT + VBEE;
	}

	if (TT > IntTvern)
	{
		double maxVernaProg = VAI * IntTvern + VBEE;
		double DLverna = Math.Max(MinDL, Math.Min(MaxDL, DayLength));
		Vernaprog += Math.Max(0, maxVernaProg * (1 + ((IntTvern - TT) / (MaxTvern - IntTvern)) * ((DLverna - MinDL) / (MaxDL - MinDL))));
	}
			
	double primordno = 2.0 * leafNumber + PNini;
	double minLeafNumber = MinFinalNumber;
	if (Vernaprog >= 1.0 || primordno >= AMXLFNO)
	{
		MinFinalNumber = Math.Max(primordno, MinFinalNumber);
		calendarMoments.Add("EndVernalisation");
        calendarCumuls.Add(cumulTT) ;
        calendarDates.Add(currentdate);  

	}
	else
	{
		double potlfno = AMXLFNO - (AMXLFNO - minLeafNumber) * Vernaprog;
		if (primordno >= potlfno)
		{
			MinFinalNumber = Math.Max((potlfno + primordno) / 2.0, MinFinalNumber);	
			calendarMoments.Add("EndVernalisation");
        	calendarCumuls.Add(cumulTT);
        	calendarDates.Add(currentdate);  					
			Vernaprog = Math.Max(1, Vernaprog);
		}

	}
}
