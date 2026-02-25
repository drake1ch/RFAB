Scriptname AA000Xarrianalterationtelegripscript extends activemagiceffect  

Event OnEffectStart(actor Target, actor Caster)
float zpos1
float zpos2
float zpos3
float zpos4
If target.IsInInterior() == 0

	header.moveto(target)
zpos1=target.getpositionZ()
	header.PushActorAway(Target, 55)
      zpos1=target.getpositionZ()
      utility.wait(2)
zpos2=target.getpositionZ()
zpos3= math.abs (zpos1-zpos2)/12
zpos4 = zpos3*Game.GetGameSettingFloat("fDiffMultHPByPCVH")
utility.wait(6)
target.DamageAV("health", zpos4)

ElseIf target.IsInInterior() == 1
	header.moveto(target)
	header.PushActorAway(Target, 66)
Caster.PushActorAway(Target, 4)
 utility.wait(0.5)
target.DamageAV("health", 50*Game.GetGameSettingFloat("fDiffMultHPByPCVH"))
EndIf


EndEvent

int Property PushForce  Auto  

ObjectReference Property header  Auto  
