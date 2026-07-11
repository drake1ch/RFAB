Scriptname RFAB_BA_SewerActivatorWell extends ObjectReference 

bool Property DoOnce = false Auto

string Property Text Auto

Message Property ConfirmMessage Auto
ObjectReference Property TeleportMarker Auto
Quest Property QuestToStart Auto

Event OnActivate(ObjectReference akRef)

	if akRef == Game.GetPlayer()

			int Button = ConfirmMessage.Show()

			if Button == 0

				if QuestToStart
					QuestToStart.Start()
                                  QuestToStart.SetStage(10)
				endif

				if TeleportMarker
					Game.GetPlayer().MoveTo(TeleportMarker)
                                 Debug.MessageBox("Вот чёрт! Теперь дороги назад нет...")
				endif

				GoToState("Done")

			endif

		endif

EndEvent


State Done

	Event OnActivate(ObjectReference akRef)
	EndEvent

EndState