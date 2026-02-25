Scriptname NEP_ReanimateAshPileScript extends ActiveMagicEffect
{Scripted effect for on death ash pile}

;-------------------------------------------------------------------------------
;
; PROPERTIES
;
;-------------------------------------------------------------------------------

EffectShader Property ShockDisintegrate01FXS Auto
{The Effect Shader we want.}

;-------------------------------------------------------------------------------
;
; VARIABLES
;
;-------------------------------------------------------------------------------

Float fDelay = 1.25

Float fDelayEnd = 1.65

Float ShaderDuration = 4.0

Bool AshPileCreated = False

Activator AshPileObject = None

Actor Victim = None

;-------------------------------------------------------------------------------
;
; FUNCTIONS
;
;-------------------------------------------------------------------------------

Function TurnToAsh()

  If AshPileCreated || !Victim.IsDead()
    Return
  EndIf

  AshPileCreated = True

  Victim.SetCriticalStage(Victim.CritStage_DisintegrateStart)

  If Victim.Is3DLoaded()
    ShockDisintegrate01FXS.Play(Victim, ShaderDuration)
  EndIf

  Utility.Wait(fDelay)
  Victim.AttachAshPile(AshPileObject)
  Utility.Wait(fDelayEnd)

  If Victim.Is3DLoaded()
    ShockDisintegrate01FXS.Stop(Victim)
    Victim.SetAlpha(0.0, True)
  EndIf

  Victim.SetCriticalStage(Victim.CritStage_DisintegrateEnd)

EndFunction

;-------------------------------------------------------------------------------
;
; EVENTS
;
;-------------------------------------------------------------------------------

Event OnEffectStart(Actor Target, Actor Caster)

  Victim = Target

EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)

  Utility.Wait(0.1)
  TurnToAsh()

EndEvent

Event OnDying(Actor Killer)

  TurnToAsh()

EndEvent

Event OnDeath(Actor Killer)

  TurnToAsh()

EndEvent
