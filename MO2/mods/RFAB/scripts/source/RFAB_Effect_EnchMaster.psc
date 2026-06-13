Scriptname RFAB_Effect_EnchMaster extends ActiveMagicEffect  

Actor _owner

bool _leftBoosted = false
bool _rightBoosted = false

float _magnitude

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_owner = akTarget
	_magnitude = GetMagnitude() / 100.0
	RegisterForMenu("Crafting Menu")
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnMenuClose(string asMenuName)
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if (akBaseObject as Weapon)
		RegisterForSingleUpdate(0.1)
	endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	if (akBaseObject as Weapon)
		RegisterForSingleUpdate(0.1)
	endif
EndEvent

Event OnUpdate()
	Enchantment kLeft = WornObject.GetEnchantment(_owner, 0, 0)
	Enchantment kRight = WornObject.GetEnchantment(_owner, 1, 0)

	if (kLeft && !_leftBoosted)
		_owner.ModActorValue("LeftWeaponSpeedMult", _magnitude)
		_leftBoosted = true
	elseif (!kLeft && _leftBoosted)
		_owner.ModActorValue("LeftWeaponSpeedMult", -_magnitude)
		_leftBoosted = false
	endif

	if (kRight && !_rightBoosted)
		_owner.ModActorValue("WeaponSpeedMult", _magnitude)
		_rightBoosted = true
	elseif (!kRight && _rightBoosted)
		_owner.ModActorValue("WeaponSpeedMult", -_magnitude)
		_rightBoosted = false
	endif
EndEvent