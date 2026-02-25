Scriptname Mirel_WeaponEnch_ChargeProc_ScriptV2 extends activemagiceffect  


GlobalVariable Property GlobalWeaponChargeCount Auto
GlobalVariable Property GlobalWeaponChargeCountMax Auto
Spell Property SpellForProc Auto
Armor Property Shield Auto
Actor Property PlayerRef Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
			GlobalWeaponChargeCount.Mod(1)
			If  ((GlobalWeaponChargeCount.GetValue() >= GlobalWeaponChargeCountMax.GetValue()) && (Game.GetPlayer().IsEquipped(Shield)))
			GlobalWeaponChargeCount.SetValue(0)
			SpellForProc.Cast(PlayerRef)
		EndIf

EndEvent