Scriptname GatheringPlantsScript extends ActiveMagicEffect  

FormList Property Filter Auto

int _distance
bool _isCasted = true
Actor _caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_distance = GetMagnitude() as int
	_caster = akTarget
	while (_isCasted)
		Process()
		Utility.Wait(0.5)
	endwhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	_isCasted = false
EndEvent

Function Process()
	ObjectReference[] kReferences = SkyPal_References.Grid_Filter_Bases_Form_List(Filter)

	if (kReferences.Length == 0)
		return
	endif

	kReferences = SkyPal_References.Filter_Distance(kReferences , _distance, _caster, "<")

	if (kReferences.Length == 0)
		return
	endif

	kReferences = SkyPal_References.Sort_Distance(kReferences , _caster, "<")

	int i = 0
	while (i < kReferences.Length)
		TryHarvest(kReferences[i])
		i += 1
	endwhile
EndFunction

Function TryHarvest(ObjectReference kRef)
	if (kRef.IsDisabled() || kRef.IsHarvested())
		return
	endif

	if (kRef.IsOffLimits() && !_caster.IsSneaking())
		return
	endif

	if (kRef.GetBaseObject() as Container)
		kRef.RemoveAllItems(_caster)
	else
		kRef.Activate(_caster)
	endif
EndFunction