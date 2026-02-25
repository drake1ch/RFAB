Scriptname RFAB_Script_Dragon_Enrage extends ActiveMagicEffect  
Explosion property FearShout auto
Float property AttackSpeed auto
Float property Speed auto
Activator property FXEmptyActivator auto 
SPELL Property Training  Auto 
SPELL Property SpellAfterRage  Auto 
bool Property CastSpell = False Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	utility.Wait(2.5)
	ObjectReference Box = akTarget.PlaceAtMe(FXEmptyActivator as form, 1, false, false)
	Debug.SendAnimationEvent(akTarget, "Enrage")
	utility.Wait(1.20000)
	Box.MovetoNode(akTarget as ObjectReference, "NPC Head MagicNode [Hmag]")
	Box.Placeatme(FearShout as form, 1, false, false)
	akTarget.SetAnimationVariableFloat("playbackSpeed", AttackSpeed)
	akTarget.SetAnimationVariableFloat("Speed", Speed)
	if CastSpell
		akTarget.AddSpell(SpellAfterRage)
	endif
	Utility.Wait(1.3)
	Box.Delete()
	akTarget.RemoveSpell(Training)
endevent
 

 
