Scriptname floatingcandles extends ObjectReference  

ObjectReference[] Property CandleArray  Auto  
Int[] Property Xarray  Auto  
Int[] Property Yarray  Auto  
ObjectReference Property Corner1  Auto  
ObjectReference Property Corner2  Auto  

float Property CandleZfloat auto
float Property CandleSpeed = 5.0 auto

Int xmin
Int xmax
Int ymin
Int ymax

Event OnCellAttach()
SetBorders()

int Count = 0

while (Count < CandleArray.length)
	Xarray[Count] = Utility.RandomInt(xmin, xmax)
	Yarray[Count] = Utility.RandomInt(ymin, ymax)

	CandleArray[Count].TranslateTo(Xarray[Count], Yarray[Count], CandleZfloat, 0, 0, 0, CandleSpeed, 1)
	Count += 1 
endwhile
CandleCheck()
EndEvent

Function SetBorders()

	if (Corner1.GetPositionX() < Corner2.GetPositionX())
		xmin = Corner1.GetPositionX() as Int
		xmax =  Corner2.GetPositionX() as Int
	else
		xmin = Corner2.GetPositionX() as Int
		xmax =  Corner1.GetPositionX() as Int
	EndIf

	if (Corner1.GetPositionY() < Corner2.GetPositionY())
		ymin = Corner1.GetPositionY() as Int
		ymax =  Corner2.GetPositionY() as Int
	else
		ymin = Corner2.GetPositionY() as Int
		ymax =  Corner1.GetPositionY() as Int
	EndIf


EndFunction

Function CandleCheck()
int Count = 0

while (Count < CandleArray.length)
	if (Xarray[Count] == CandleArray[Count].GetPositionX()) && (Yarray[Count] == CandleArray[Count].GetPositionY())
		Xarray[Count] = Utility.RandomInt(xmin, xmax)
		Yarray[Count] = Utility.RandomInt(ymin, ymax)

		CandleArray[Count].TranslateTo(Xarray[Count], Yarray[Count], CandleZfloat, 0, 0, 0, CandleSpeed, 1)
	else
	int Count2 = 0
	while (Count2 < CandleArray.length)
		if (Count != Count2) && (math.SQRT(math.pow(CandleArray[Count].GetPositionX() - CandleArray[Count2].GetPositionX(), 2) + math.pow(CandleArray[Count].GetPositionY() - CandleArray[Count2].GetPositionY(), 2)) < 50)
			
			if (Xarray[Count] - CandleArray[Count].GetPositionX() < 0)
				Xarray[Count] = Utility.RandomInt(CandleArray[Count].GetPositionX() as Int, xmax)
			else
				Xarray[Count] = Utility.RandomInt(xmin, CandleArray[Count].GetPositionX() as Int)
			EndIf

			If (Yarray[Count] - CandleArray[Count].GetPositionY() < 0)
				Yarray[Count] = Utility.RandomInt(CandleArray[Count].GetPositionY() as Int, ymax)
			else
				Yarray[Count] = Utility.RandomInt(ymin, CandleArray[Count].GetPositionY() as Int)
			EndIf

			CandleArray[Count].TranslateTo(Xarray[Count], Yarray[Count], CandleZfloat, 0, 0, 0, CandleSpeed, 1)
		endif
		Count2 += 1 
	endwhile
	endif
	Count += 1 
endwhile
Utility.Wait(1)
	if (Game.getPlayer().GetParentCell() == Corner1.GetParentCell())
		CandleCheck()
	EndIf
endfunction 
