;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_KingOlafsFestivalStarter_0001703C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Karita
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Karita Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lurbuk
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lurbuk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;USKP 2.0.1 - Start conditions for this quest have been restricted to when the festival should be running.
Float CurrentHour = GameHour.GetValue()
if ((GetDayOfWeek() == 6) && (CurrentHour >= 20.00)) || ((GetDayOfWeek() == 0) && (CurrentHour < 4.00))
  MS05KingOlafsFestival.Setstage(0)
endif

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Int Function GetDayOfWeek()
	Int GameDaysPassed
 
	GameDaysPassed = Utility.GetCurrentGameTime() as Int
	return (GameDaysPassed % 7) as Int
EndFunction
GlobalVariable Property GameHour Auto

Quest Property BardSongs  Auto  

Keyword Property BardSongsKeyword  Auto  

ReferenceAlias Property BardSongs_Bard  Auto  

Faction Property BardSingerNoAutostart  Auto  

Quest Property DA16  Auto  

Faction Property BardSingerInstrumentalOnly  Auto  

Package Property MorthalLurbukSleep1x5  Auto  

Quest Property MS05KingOlafsFestival  Auto  
