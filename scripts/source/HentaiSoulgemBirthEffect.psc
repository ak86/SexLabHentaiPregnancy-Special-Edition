Scriptname HentaiSoulgemBirthEffect extends ActiveMagicEffect  

Event OnEffectStart(Actor Target, Actor Caster)
	HentaiPregnancy HentaiP = Quest.GetQuest("HentaiPregnancyQuest") as HentaiPregnancy
	
	if HentaiP.config.SoulGemPregnancy
		int i = 0
		while i < HentaiP.PregnantActors.Length
			if HentaiP.PregnantActors[i].getState() == "Pregnant" && HentaiP.PregnantActors[i].getMother() == Caster
				HentaiP.PregnantActors[i].GoToState("SoulGemBirth")
				return
			endIf
			i += 1
		endWhile
	endif
endEvent