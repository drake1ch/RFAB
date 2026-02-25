ScriptName dlc2RFABStoneScript Extends ObjectReference

GlobalVariable Property Stone Auto
Float Property StoneNum Auto
message Property ChoiceMsg Auto
Spell Property StoneSpell Auto



Event OnActivate(ObjectReference akActionRef)
utility.Wait(0.2)
if akActionRef == game.GetPlayer()
  if (akActionRef as actor).HasSpell(StoneSpell) == 1
      int i = ChoiceMsg.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
      if i == 0
        Stone.SetValue(StoneNum as Float)
      elseif i == 1
        Stone.SetValue(0 as Float)
      elseif i > 1
        return
      endif
    endif
  endif
EndEvent
