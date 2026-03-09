;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname USKP_QF_DrownedSorrowsFix_0201E8BD Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
if( FreeformWinterholdC.GetStage() >= 10 )
 if( FreeformWinterholdC.GetStage() == 10 )
  FreeformWinterholdC.SetObjectiveDisplayed(10)
 elseif( FreeformWinterholdC.GetStage() == 20 )
  FreeformWinterholdC.SetObjectiveDisplayed(10)
  FreeformWinterholdC.SetObjectiveCompleted(10)
  FreeformWinterholdC.SetObjectiveDisplayed(15)
  FreeformWinterholdC.SetObjectiveCompleted(15)
  FreeformWinterholdC.SetObjectiveDisplayed(20)
 elseif( FreeformWinterholdC.GetStage() == 30 )
  FreeformWinterholdC.SetObjectiveDisplayed(10)
  FreeformWinterholdC.SetObjectiveCompleted(10)
  FreeformWinterholdC.SetObjectiveDisplayed(15)
  FreeformWinterholdC.SetObjectiveCompleted(15)
  FreeformWinterholdC.SetObjectiveDisplayed(20)
  FreeformWinterholdC.SetObjectiveCompleted(20)
  FreeformWinterholdC.SetObjectiveDisplayed(30)
 else
  FreeformWinterholdC.SetObjectiveDisplayed(10)
  FreeformWinterholdC.SetObjectiveCompleted(10)
  FreeformWinterholdC.SetObjectiveDisplayed(15)
  FreeformWinterholdC.SetObjectiveCompleted(15)
  FreeformWinterholdC.SetObjectiveDisplayed(20)
  FreeformWinterholdC.SetObjectiveCompleted(20)
  FreeformWinterholdC.SetObjectiveDisplayed(30)
  FreeformWinterholdC.SetObjectiveCompleted(30)
  FreeformWinterholdC.Completequest()
  FreeformWinterholdC.Stop()
 endif
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FreeformWinterholdC  Auto  
