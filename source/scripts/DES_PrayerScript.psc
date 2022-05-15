Scriptname DES_PrayerScript extends ActiveMagicEffect

DES_FaithScript Property DES_FaithQuest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DES_FaithQuest.prayerBless()
endEvent