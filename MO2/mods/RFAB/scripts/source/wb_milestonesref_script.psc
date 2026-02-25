Scriptname WB_MilestonesRef_Script extends ReferenceAlias  

; -----

Message Property WB_AlterationAlt_Message_Milestones_Nr Auto
ReferenceAlias Property WB_Spawner Auto
ReferenceAlias[] Property WB_OtherMilestone Auto
VisualEffect Property WB_AlterationAlt_VFX_MarkAndRecall Auto
VisualEffect Property WB_AlterationAlt_VFX_Collapse Auto
Explosion Property WB_AlterationAlt_Explosion_MarkAndRecall Auto
GlobalVariable Property WB_Alteration_Milestones_Global_InUse Auto
Explosion Property WB_AlterationAlt_Explosion_FabricateObject Auto

; -----

Event OnActivate(ObjectReference akActivator)

	If akActivator == Game.GetPlayer()
		Int Choice = WB_AlterationAlt_Message_Milestones_Nr.Show()
		If Choice == 4
			; toggle
			ObjectReference TheGlow = GetReference().GetLinkedRef()
			If TheGlow.IsEnabled()
				TheGlow.Disable()
			Else
				TheGlow.Enable()
			EndIf
		ElseIf Choice == 5
			; destroy
			ObjectReference SelfObject = Self.GetReference()
			ObjectReference MarkerObject = WB_Spawner.GetReference()
			SelfObject.PlaceAtMe(WB_AlterationAlt_Explosion_FabricateObject)
			SelfObject.GetLinkedRef().MoveTo(MarkerObject)
			SelfObject.MoveTo(MarkerObject)
			WB_Alteration_Milestones_Global_InUse.SetValue(0)
		ElseIf Choice <= 3
			; teleport
			ObjectReference DestinationMilestone = WB_OtherMilestone[Choice].GetReference()
			Actor ThePlayer = Game.GetPlayer()
			ThePlayer.MoveTo(DestinationMilestone)
			WB_AlterationAlt_VFX_MarkAndRecall.Play(ThePlayer,3.5)
			WB_AlterationAlt_VFX_Collapse.Play(ThePlayer,3.5)
			ThePlayer.PlaceAtMe(WB_AlterationAlt_Explosion_MarkAndRecall)
		EndIf

	EndIf

EndEvent

; -----