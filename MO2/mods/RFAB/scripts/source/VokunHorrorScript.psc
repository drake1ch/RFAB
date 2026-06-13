ScriptName VokunHorrorScript Extends ObjectReference

ObjectReference Property Start Auto
Actor Property horror Auto

Event OnLoad()
  Actor playerRef = Game.GetPlayer() 
  Float speed = 50 as Float 
  horror.moveto(Start, 0.0, 0.0, 0.0, True) 
  horror.setactorvalue("speedmult", speed) 
  horror.KeepOffsetFromActor(playerRef, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 200.0, 80.0) 
  While !horror.isdead() 
    Utility.wait(1.0) 
    if speed < 110.0 
      speed += 5.0 
      if speed > 110.0 
        speed = 110.0
      endif
    endif
    horror.setactorvalue("speedmult", speed) 
    horror.KeepOffsetFromActor(playerRef, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 200.0, 80.0) 
  EndWhile
EndEvent
