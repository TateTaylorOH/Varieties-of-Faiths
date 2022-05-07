Scriptname DES_FaithScript extends Quest

Actor Property PlayerRef Auto
Message Property DES_AltarNoBlessingMsg Auto

Spell[] Property recentBlessings Auto hidden
Message[] Property recentMessages Auto hidden

Event OnInit()
	resetVariables()
endEvent

function resetVariables()
	recentBlessings = new Spell[8]
	recentMessages = new Message[8]
endFunction

function bless(Actor target, Spell blessing, Message blessingMessage = None, Message removeBlessings = None)
	if(blessing && target)
		blessing.cast(target, target)
		if(target == PlayerRef)
			showMessage(removeBlessings, "Other blessings removed")
			showMessage(blessingMessage, blessing.getName() + " added")
			addBlessingToRecents(blessing, blessingMessage)
		endIf
	elseif(target == PlayerRef)
		DES_AltarNoBlessingMsg.show()
	endIf
endFunction

function shrineBless(TempleBlessingScript shrine, Actor target)
	bless(target, shrine.TempleBlessing, shrine.BlessingMessage, shrine.AltarRemoveMsg)
endFunction

function prayerBless(int index = 0)
	bless(PlayerRef, recentBlessings[index], recentMessages[index])
endFunction

function showMessage(Message m, string fallback)
	if(m)
		m.show()
	else
		debug.notification(fallback)
	endIf
endFunction

function addBlessingToRecents(Spell newBlessing, Message newMessage)
	int index = recentBlessings.find(newBlessing)
	int i = recentBlessings.length - 1
	if(index >= 0)
		i = index
	endIf
	while i > 0
		recentBlessings[i] = recentBlessings[i - 1]
		recentMessages[i] = recentMessages[i - 1]
		i -= 1
	endWhile
	recentBlessings[0] = newBlessing
	recentMessages[0] = newMessage
endFunction