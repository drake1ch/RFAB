Scriptname NEP_ReanimateEffectScript extends ActiveMagicEffect
{Script to add reanimated actors to the reanimated thrall tracking quest.}

;-------------------------------------------------------------------------------
;
; PROPERTIES
;
;-------------------------------------------------------------------------------

ReferenceAlias[] Property ZombieAliases Auto
{Aliases for storing reanimated thrall references.}

;-------------------------------------------------------------------------------
;
; EVENTS
;
;-------------------------------------------------------------------------------

Event OnEffectStart(Actor Target, Actor Caster)

  Bool AliasFound = False
  Int Index = ZombieAliases.Length

  While Index && !AliasFound
    Index -= 1

    ReferenceAlias ZombieAlias = ZombieAliases[Index]
    Actor Zombie = ZombieAlias.GetReference() as Actor

    If Zombie == None
      AliasFound = True
    ElseIf Zombie.IsDead() || Zombie.IsDisabled() || Zombie.IsDeleted()
      AliasFound = True

      Zombie.DispelAllSpells()
      Zombie.Kill()
      ZombieAlias.Clear()
    EndIf

    If AliasFound
      ZombieAlias.ForceRefTo(Target as ObjectReference)
    EndIf
  EndWhile

EndEvent
