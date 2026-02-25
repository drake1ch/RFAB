Scriptname RFAB_PerkGlobal extends Perk  

GlobalVariable Property Variable Auto
float Property Value = 0.0 Auto
bool Property UpdateVendors = false Auto

bool Function IsValueEqual()
	return Variable.GetValue() == Value
EndFunction

Function ApplyValue()
	Variable.SetValue(Value)
EndFunction