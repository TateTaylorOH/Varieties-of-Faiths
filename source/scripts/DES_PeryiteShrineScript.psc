Scriptname DES_PeryiteShrineScript extends TempleBlessingScript

Event OnActivate(ObjectReference actronaut)
	DES_FaithScript faith = Quest.getQuest("DES_FaithQuest") as DES_FaithScript
	faith.shrineBless(self, actronaut as Actor, cureDisease = false)
EndEvent