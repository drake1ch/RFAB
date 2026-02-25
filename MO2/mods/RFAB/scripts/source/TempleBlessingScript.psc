Scriptname TempleBlessingScript extends ObjectReference

RFAB_BlessingMenu Property BlessingMenu Auto

Spell Property TempleBlessing Auto
Spell property Cure Auto

Event OnActivate(ObjectReference akRef)
	Actor kUser = akRef as Actor

	if (kUser != Game.GetPlayer())
		return
	endif

	int iButton = SkyMessage.Show( \
		BlessingMenu.GetDescription(GetDisplayName()), \
		"Получить благословение", \
		"Исцелить недуги", \
		"Ничего не делать", \
		getIndex = true) as int

	if (iButton == 0)
		if (BlessingMenu.IsBlocked(TempleBlessing))
			Debug.Notification("Алтарь никак не реагирует на мои молитвы...")
			return
		else
			BlessingMenu.ChangeBlessing(TempleBlessing)
			ShowNotification()
		endif
	elseif (iButton == 1)
		Cure.Cast(kUser, kUser)
	endif
EndEvent

Function ShowNotification()
	string sName = TempleBlessing.GetName()
	int iSpace = StringUtil.Find(sName, " ")
	string sFirst = StringUtil.Substring(sName, 0, iSpace)
	string sRest = StringUtil.Substring(sName, iSpace)
	Debug.Notification("Получено " + RFAB_PapyrusFunctions.ToLowerCase(sFirst) + sRest)
EndFunction