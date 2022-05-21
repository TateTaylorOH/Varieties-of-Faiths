Scriptname DES_ClavicusVileEffect extends ActiveMagicEffect

Spell Property BuffHealth Auto
Spell Property BuffStamina Auto
Spell Property BuffMagicka Auto

Spell Property DebuffHealth Auto
Spell Property DebuffStamina Auto
Spell Property DebuffMagicka Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	float health = akTarget.getActorValueMax("Health")
	float stamina = akTarget.getActorValueMax("Stamina")
	float magicka = akTarget.getActorValueMax("Magicka")
	;i miss max and min functions
	float max = health
	float min = health
	if(stamina > max)
		max = stamina
	endIf
	if(magicka > max)
		max = magicka
	endIf
	if(stamina < min)
		min = stamina
	endIf
	if(magicka < min)
		min = magicka
	endIf
	;cast
	if(max == magicka)
		BuffMagicka.cast(akTarget, akTarget)
	elseif(max == stamina)
		BuffStamina.cast(akTarget, akTarget)
	else
		BuffHealth.cast(akTarget, akTarget)
	endIf
	if(min == health)
		DebuffHealth.cast(akTarget, akTarget)
	elseif(min == stamina)
		DebuffStamina.cast(akTarget, akTarget)
	else
		DebuffMagicka.cast(akTarget, akTarget)
	endIf
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.dispelSpell(BuffHealth)
	akTarget.dispelSpell(BuffStamina)
	akTarget.dispelSpell(BuffMagicka)
	akTarget.dispelSpell(DebuffHealth)
	akTarget.dispelSpell(DebuffStamina)
	akTarget.dispelSpell(DebuffMagicka)
endEvent