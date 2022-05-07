Scriptname TempleBlessingScript extends ObjectReference Conditional

Message Property AltarRemoveMsg Auto
Message Property BlessingMessage Auto
Spell Property TempleBlessing Auto 

Event OnActivate(ObjectReference actronaut)
	DES_FaithScript faith = Quest.getQuest("DES_FaithQuest") as DES_FaithScript
	faith.shrineBless(self, actronaut as Actor)
EndEvent


