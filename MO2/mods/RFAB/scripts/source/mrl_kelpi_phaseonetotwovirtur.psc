Scriptname MRL_KELPI_PhaseOneToTwoVirtur extends ActiveMagicEffect  

Weapon Property BoundSwordRight Auto
Weapon Property BoundSwordLeft Auto
Weapon Property BoundBattleAxe Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.1)
	akTarget.RemoveItem(BoundBattleAxe,akTarget.GetItemCount(BoundBattleAxe),true)
	akTarget.AddItem(BoundSwordRight,1,true)
	akTarget.EquipItem(BoundSwordRight, true, true)
	akTarget.AddItem(BoundSwordLeft,1,true)
	akTarget.EquipItem(BoundSwordLeft, true, true)

EndEvent