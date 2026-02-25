scriptName transmuteTreeScript extends ActiveMagicEffect

leveleditem property GoldTT auto
miscobject property TreeTT auto
sound property FailureSFX auto
message property failureMSG auto


function OnEffectStart(Actor akTarget, Actor akCaster)

	objectreference caster = akCaster as objectreference
	if caster.getItemCount(TreeTT as form) >= 1
		caster.removeItem(TreeTT as form, 1, false, none)
		caster.addItem(GoldTT as form, 1, false)
	else
		FailureSFX.play(caster)
		failureMSG.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	endIf
endFunction