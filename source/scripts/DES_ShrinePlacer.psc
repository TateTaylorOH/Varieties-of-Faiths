Scriptname DES_ShrinePlacer extends Quest

ObjectReference Property UmbraVileShrine Auto
ObjectReference Property UmbraVileNavcut Auto

Event OnInit()
	registerForSingleUpdate(5.0)
endEvent

Event OnUpdate()
	placeUmbraShrine()
endEvent

function placeUmbraShrine()
	ObjectReference ref = Game.getFormFromFile(0x04000805, "ccbgssse016-umbra.esm") as ObjectReference
	UmbraVileShrine.moveTo(ref)
	UmbraVileShrine.setPosition(-48.0, -3632.0, -1396.0)
	UmbraVileNavcut.moveTo(ref)
	UmbraVileNavcut.setPosition(-58.625, -3609.5, -1649.307251)
endFunction