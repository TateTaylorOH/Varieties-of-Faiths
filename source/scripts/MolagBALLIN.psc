Scriptname MolagBALLIN extends ActiveMagicEffect

Actor Property PlayerRef Auto
GlobalVariable Property DES_HealthPercent Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DES_HealthPercent.setValue(PlayerRef.getActorValuePercentage("Health"))
	registerForSingleUpdate(5.0)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	unregisterForUpdate()
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	registerForSingleUpdate(0.1)
endEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	registerForSingleUpdate(0.1)
EndEvent

Event OnUpdate()
	DES_HealthPercent.setValue(PlayerRef.getActorValuePercentage("Health"))
	registerForSingleUpdate(5.0)
endEvent