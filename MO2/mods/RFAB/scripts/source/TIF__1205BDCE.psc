;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__1205BDCE Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Reward()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject[] Property Trophies  Auto  
MiscObject Property Gold001  Auto  
Bool iReady = false

Function Reward()

    Int i = 0
    Int RewardGold = 0
    While  i < Trophies.length
        If game.GetPlayer().GetItemCount(Trophies[i]) > 0
            iReady = true
            RewardGold += game.GetPlayer().GetItemCount(Trophies[i]) * Trophies[i].getgoldvalue()
            game.GetPlayer().RemoveItem(Trophies[i], game.GetPlayer().GetItemCount(Trophies[i]), true, none)
        EndIf
        i += 1
    EndWhile
    If iReady
        game.GetPlayer().AddItem(Gold001, RewardGold, false)
    EndIf
EndFunction
