Scriptname TGRQueueQuestScript extends Quest  Conditional

LocationAlias Property pTGRQHouse01 Auto
LocationAlias Property pTGRQHouse02 Auto
LocationAlias Property pTGRQHouse03 Auto
LocationAlias Property pTGRQHouse04 Auto
LocationAlias Property pTGRQHouse05 Auto

LocationAlias Property pTGRQBusiness01 Auto
LocationAlias Property pTGRQBusiness02 Auto
LocationAlias Property pTGRQBusiness03 Auto
LocationAlias Property pTGRQBusiness04 Auto
LocationAlias Property pTGRQBusiness05 Auto

Keyword Property TGWealthyHome Auto
Keyword Property TGBusiness Auto

;USKP 2.0.4 - Whole function lacks sanity checking. Spams logs like mad. This is a 4 for 1 deal!
Function UpdateQueue(LocationAlias pTGRQLastCalled, Keyword pTGRQKeyword)

	;if this is a business run the business queue
	If (pTGRQKeyword == TGBusiness)
		;set data on the incoming location and clear the oldest location
		pTGRQLastCalled.GetLocation().SetKeywordData(TGBusiness, 1)
		if( pTGRQBusiness05.GetLocation() )
			pTGRQBusiness05.GetLocation().SetKeywordData(TGBusiness, 0)
		endif

		;reset the queue
		if( pTGRQBusiness04.GetLocation() )
			pTGRQBusiness05.ForceLocationto(pTGRQBusiness04.GetLocation())
		EndIf
		if( pTGRQBusiness03.GetLocation() )
			pTGRQBusiness04.ForceLocationto(pTGRQBusiness03.GetLocation())
		EndIf
		if( pTGRQBusiness02.GetLocation() )
			pTGRQBusiness03.ForceLocationto(pTGRQBusiness02.GetLocation())
		EndIf
		if( pTGRQBusiness01.GetLocation() )
			pTGRQBusiness02.ForceLocationto(pTGRQBusiness01.GetLocation())
		EndIf
		pTGRQBusiness01.ForceLocationto(pTGRQLastCalled.GetLocation())

	;if this is a home run the home queue
	ElseIf (pTGRQKeyword == TGWealthyHome)
		;set data on the incoming location and clear the oldest location
		pTGRQLastCalled.GetLocation().SetKeywordData(TGWealthyHome, 1)
		if( pTGRQHouse05.GetLocation() )
			pTGRQHouse05.GetLocation().SetKeywordData(TGWealthyHome, 0)
		EndIf

		;reset the queue
		if( pTGRQHouse04.GetLocation() )
			pTGRQHouse05.ForceLocationto(pTGRQHouse04.GetLocation())
		EndIf
		if( pTGRQHouse03.GetLocation() )
			pTGRQHouse04.ForceLocationto(pTGRQHouse03.GetLocation())
		EndIf
		if( pTGRQHouse02.GetLocation() )
			pTGRQHouse03.ForceLocationto(pTGRQHouse02.GetLocation())
		EndIf
		if( pTGRQHouse01.GetLocation() )
			pTGRQHouse02.ForceLocationto(pTGRQHouse01.GetLocation())
		EndIf
		pTGRQHouse01.ForceLocationto(pTGRQLastCalled.GetLocation())
	EndIf

endFunction