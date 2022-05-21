Scriptname DES_MolagBalAltarScript extends TempleBlessingScript  

Quest Property DA10 auto

Event OnActivate(ObjectReference actronaut)
	if(DA10.IsStageDone(80) && actronaut == Game.getPlayer())
		parent.OnActivate(actronaut)
	endIf
EndEvent