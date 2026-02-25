Scriptname SpellcastingScript_aaaDanj extends ObjectReference  

ObjectReference Property Kletka  Auto  

Actor Property Varis  Auto  

SPELL Property invis  Auto  

SPELL Property Knock  Auto  

Event OnActivate(ObjectReference akActionRef)

	Invis.cast (Caster, Caster)

endevent
ObjectReference Property caster  Auto  
