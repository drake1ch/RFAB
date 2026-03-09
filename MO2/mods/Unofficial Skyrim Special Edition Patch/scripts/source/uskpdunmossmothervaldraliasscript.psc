Scriptname USKPdunMossMotherValdrAliasScript extends ReferenceAlias

int Property HealedStage = 15 Auto Hidden
Keyword Property MagicRestoreHealth Auto

;When the cell loads or the quest starts, damage Valdr's health.
Event OnLoad()
	if (GetOwningQuest().GetStage() < HealedStage)
		InjureValdr()
	endIf
endEvent

Event OnInit()
	if( GetOwningQuest().IsRunning() )
		if (GetOwningQuest().GetStage() < HealedStage)
			InjureValdr()
		Else
			Self.GetActorReference().SetRestrained(False)
		EndIf
	EndIf
endEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	Actor Valdr = GetActorReference()
	Actor Player = Game.GetPlayer()
	if (GetOwningQuest().GetStage() < HealedStage)
		if (akCaster == Player) && (akEffect.HasKeyword(MagicRestoreHealth))
			GetOwningQuest().SetStage(HealedStage)
			Valdr.RestoreActorValue("Health", 75)
		endif
	endif
endEvent

Function InjureValdr()
	Actor Valdr = GetActorReference()
	Valdr.DamageActorValue("Health", Valdr.GetActorValue("Health") - 1)
endFunction
