Scriptname DA06HammerTriggerScript extends TempleBlessingScript

ObjectReference Property ShagrolsHammer Auto
ReferenceAlias Property DA06ShagrolsHammerAlias Auto
ObjectReference Property Volendrung Auto
QF_DA06_0003B681 Property DA06 Auto

Event OnActivate (ObjectReference ActionRef)
	if (DA06.GetStage() == 120 && DA06.DA06HammerTriggerRef == self)
		if ActionRef == Game.GetPlayer()
			Game.DisablePlayerControls()
			Game.GetPlayer().RemoveItem(DA06ShagrolsHammerAlias.GetReference(), 1)
			ShagrolsHammer.Enable(true)
			Utility.Wait(2)
			ShagrolsHammer.Disable()
			Volendrung.Enable()
			Game.EnablePlayerControls()
			DA06.SetStage(200)
		endif
	else
		parent.OnActivate(ActionRef)
	endif
EndEvent