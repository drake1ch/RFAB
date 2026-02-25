Scriptname JeensEating extends Actor

Idle property AnimIdle auto
ObjectReference property Chair auto
Event OnSit(ObjectReference akFurniture)
     If akFurniture == Chair
          PlayIdle(AnimIdle)
     EndIf
EndEvent