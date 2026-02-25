Scriptname Naylte_SpellToggle extends activemagiceffect
{Allows a "fire and forget" spell to toggle a "constant effect" ability when cast.}

; -----  ----- ----- ----- ----- ----- ----- ----- ----- -----

;/+---------------------------------------------------------+
  |															|
  | Properties												|
  |															|
  +---------------------------------------------------------+/;

Spell Property ToggledAbility auto

;/+---------------------------------------------------------+
  |															|
  | Events													|
  |															|
  +---------------------------------------------------------+/;

Event OnEffectStart (Actor akTarget, Actor akCaster)
        If akTarget.HasSpell(ToggledAbility) == false
                akTarget.AddSpell(ToggledAbility, false)
        Else
                akTarget.RemoveSpell(ToggledAbility)
        EndIf
EndEvent