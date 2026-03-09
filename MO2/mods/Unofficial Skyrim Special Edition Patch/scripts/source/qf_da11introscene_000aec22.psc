;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DA11IntroScene_000AEC22 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Verulus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Verulus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thongvor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thongvor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;if Thongvor rules the Reach, have everything end.
;USKP 2.0.4 - Also if he's been exiled to Windhelm.
If( Alias_Thongvor.GetActorReference().IsInFaction(GovRuling) == True || Alias_Thongvor.GetActorReference().IsInFaction(GovExiled) == True )
 SetStage(15)
Else
 ;start scene
 ;USKP 2.0.6 - Bug #16646: Only start scene if the above conditions are not met.
 DA11IntroSceneStart.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DA11IntroSceneStart  Auto  

Faction Property GovRuling  Auto  
Faction Property GovExiled Auto ;USKP 2.0.4
