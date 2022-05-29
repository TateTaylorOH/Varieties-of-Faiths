Scriptname DES_AlduinShrineScript extends TempleBlessingScript

Quest Property MQ305 Auto

Event OnActivate(ObjectReference actronaut)
	if(MQ305.isStageDone(200))
		AltarRemoveMsg = None
		BlessingMessage = None
		TempleBlessing = None
	endIf
	DES_FaithScript faith = Quest.getQuest("DES_FaithQuest") as DES_FaithScript
	faith.shrineBless(self, actronaut as Actor, cureDisease = false)
EndEvent