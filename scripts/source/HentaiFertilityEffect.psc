Scriptname HentaiFertilityEffect extends ActiveMagicEffect  

HentaiPregnancy HentaiP

Event OnEffectStart(Actor Target, Actor Caster)
	HentaiP = Quest.GetQuest("HentaiPregnancyQuest") as HentaiPregnancy
	float magnitude = HentaiP.config.PregnancyChance as float
	
	if Caster.HasSpell(HentaiP.HentaiFertilityBlessingSpell)
		magnitude = HentaiP.HentaiFertilityBlessingSpell.GetNthEffectMagnitude(0)
	elseif Caster.HasSpell(HentaiP.HentaiFertilityCurseSpell)
		magnitude = HentaiP.HentaiFertilityCurseSpell.GetNthEffectMagnitude(0)
	endif

	Caster.SetFactionRank(HentaiP.HentaiFertilityFaction, magnitude as int)
endEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	Caster.RemoveFromFaction(HentaiP.HentaiFertilityFaction)
EndEvent
