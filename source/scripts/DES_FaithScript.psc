Scriptname DES_FaithScript extends Quest

Actor Property PlayerRef Auto
Message Property DES_AltarNoBlessingMsg Auto
Message Property AltarRemoveMsg Auto

Spell Property Prayer Auto
Spell[] Property recentBlessings Auto hidden
Message[] Property recentMessages Auto hidden
string[] Property godNames Auto hidden

float longPressTime
bool longPress
bool released

Event OnInit()
	resetVariables()
	registerForControl("Shout")
endEvent

function resetVariables()
	longPress = false
	released = true
	recentBlessings = new Spell[9]
	recentMessages = new Message[9]
	godNames = new string[9]
	longPressTime = Game.getGameSettingFloat("fShoutTime2")
endFunction

function bless(Actor target, Spell blessing, Message blessingMessage = None, string godName = "")
	if(target == PlayerRef && !PlayerRef.hasSpell(Prayer))
		PlayerRef.addSpell(Prayer)
	endIf
	if(blessing && target)
		blessing.cast(target, target)
		if(target == PlayerRef)
			AltarRemoveMsg.show()
			showMessage(blessingMessage, blessing.getName() + " added")
			addBlessingToRecents(blessing, blessingMessage, godName)
		endIf
	elseif(target == PlayerRef)
		DES_AltarNoBlessingMsg.show()
	endIf
endFunction

function shrineBless(TempleBlessingScript shrine, Actor target)
	bless(target, shrine.TempleBlessing, shrine.BlessingMessage, shrine.godName)
endFunction

function prayerBless()
	utility.wait(0.1)
	int index = 0
	if(longPress)
		Form f = Game.GetFormFromFile(0xE05, "UIExtensions.esp")
		if(f && f as UIListMenu)
			UIListMenu list = f as UIListMenu
			list.resetMenu()
			int i = 0
			while (i < 9 && recentBlessings[i])
				string text = "Pray to " + godNames[i]
				list.addEntryItem(text)
				i += 1
			endWhile
			if(i > 0)
				int j = list.openMenu()
				index = list.getResultInt()
			endIf
		endIf
	endIf
	if(index >= 0 && recentBlessings[index])
		bless(PlayerRef, recentBlessings[index], recentMessages[index], godNames[index])
	endIf
endFunction

function showMessage(Message m, string fallback)
	if(m)
		m.show()
	else
		debug.notification(fallback)
	endIf
endFunction

function addBlessingToRecents(Spell newBlessing, Message newMessage, string newName)
	int index = recentBlessings.find(newBlessing)
	int i = recentBlessings.length - 1
	if(index >= 0)
		i = index
	endIf
	if(newName == "")
		string s = newBlessing.getName() ;most blessing names take the form "Blessing of X" or "Favor of X"
		int firstSpaceIndex = StringUtil.find(s, " ") ;therefore, if we assume the first two words are "Noun of"
		int secondSpaceIndex = StringUtil.find(s, " ", firstSpaceIndex + 1); we can extract the name after the spaces
		newName = StringUtil.substring(s, secondSpaceIndex + 1); this is a janky workaround and the property should still be filled out
	endIf
	while i > 0
		recentBlessings[i] = recentBlessings[i - 1]
		recentMessages[i] = recentMessages[i - 1]
		godNames[i] = godNames[i - 1]
		i -= 1
	endWhile
	recentBlessings[0] = newBlessing
	recentMessages[0] = newMessage
	godNames[0] = newName
endFunction

Event OnControlDown(string control)
	longPress = false
	released = false
EndEvent

Event OnControlUp(string control, float HoldTime)
	longPress = HoldTime >= longPressTime
	released = true
EndEvent