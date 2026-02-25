Scriptname WB_Entomb_Quest_Script extends Quest  

; -----

ReferenceAlias Property WB_Victim Auto
ObjectReference Property WB_Destination Auto
Activator Property FXEmptyActivator Auto
Sound Property WB_AlterationBaleful_Marker_Explosion_Subsonic Auto
Hazard Property WB_AlterationEarth_Hazard_Entomb  Auto
Explosion Property WB_AlterationEarth_Explosion_Entomb Auto
EffectShader Property WB_AlterationEarth_FXS_DancingStones_EQ Auto
Float Property WB_HeightMultSink Auto
Float Property WB_HeightMultScale Auto
Spell Property WB_S_A075_Entomb_Spell_Ab_PC Auto

Float Property WB_GameDaysPassedBeforeInsane Auto
GlobalVariable Property GameDaysPassed Auto

Spell Property WB_S_A075_Entomb_Spell_Insanity_PC Auto
Message Property WB_AlterationEarth_Message_Entomb_Insanity Auto

GlobalVariable Property WB_Alteration_EntombStatus_Global Auto

; -----

Actor CasterActor
Float TimeBuried

; -----

Function StartEntombing(Actor akTarget, Actor akCaster)

	; set status
	WB_Alteration_EntombStatus_Global.SetValue(2)

	; explosion visual
	akTarget.PlaceAtMe(WB_AlterationEarth_Explosion_Entomb)

	; get target height
	Float TargetHeight = akTarget.GetHeight()

	; create boxes
	ObjectReference TheFountain = akTarget.PlaceAtMe(WB_AlterationEarth_Hazard_Entomb)
	TheFountain.SetScale(TargetHeight * WB_HeightMultScale)
	ObjectReference TheBoxDeep = akTarget.PlaceAtMe(FXEmptyActivator)
	TheBoxDeep.MoveTo(TheFountain, 0,0, -500)

	; drag the target down
	akTarget.TranslateToRef(TheBoxDeep, TargetHeight * WB_HeightMultSink)

	; explosion sound
	WB_AlterationBaleful_Marker_Explosion_Subsonic.Play(TheFountain)

	; sadistic delay
	Utility.Wait(3.0)

	; we have a new victim
	WB_Victim.ForceRefTo(akTarget)
	akTarget.MoveTo(WB_Destination)
	akTarget.StopTranslation()

	CasterActor = akCaster

	Game.GetPlayer().AddSpell(WB_S_A075_Entomb_Spell_Ab_PC, false)
	TimeBuried = GameDaysPassed.GetValue()
	TheFountain.Disable(true)
	Thefountain.Delete()
	TheBoxDeep.Delete()
	WB_Alteration_EntombStatus_Global.SetValue(1)

EndFunction

; -----

Function ReleaseCurrentVictim(ObjectReference akLocation)

	Actor PreviousVictim = WB_Victim.GetActorReference()
;	PreviousVictim.Disable()
	PreviousVictim.MoveTo(akLocation)
;	PreviousVictim.Enable(true)

	; shader and explosion visual
	PreviousVictim.PlaceAtMe(WB_AlterationEarth_Explosion_Entomb)
	WB_AlterationEarth_FXS_DancingStones_EQ.Play(PreviousVictim)

	; insanity
	If GameDaysPassed.GetValue() >= TimeBuried + WB_GameDaysPassedBeforeInsane
		WB_AlterationEarth_Message_Entomb_Insanity.Show()
		WB_S_A075_Entomb_Spell_Insanity_PC.Cast(PreviousVictim)
	EndIf

	; retaliate
	PreviousVictim.StartCombat(CasterActor)

	Game.GetPlayer().RemoveSpell(WB_S_A075_Entomb_Spell_Ab_PC)
	WB_Alteration_EntombStatus_Global.SetValue(0)

EndFunction

; -----