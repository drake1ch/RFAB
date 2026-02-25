;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_RFAB_BA_Quest_Start_1600AC8A Extends Quest Hidden

;BEGIN ALIAS PROPERTY PersonaEnding
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PersonaEnding Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Persona
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Persona Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sheogorath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sheogorath Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
utility.wait(0.1)
EndingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property EndingScene  Auto  
