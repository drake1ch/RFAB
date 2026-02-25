Scriptname WerewolfTimer extends ActiveMagicEffect  

quest property PlayerWerewolfQuest  auto
Event OnEffectFinish(Actor Target, Actor Caster)
	
	PlayerWerewolfQuest .SetStage(100)
endevent