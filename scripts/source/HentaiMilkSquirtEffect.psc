Scriptname HentaiMilkSquirtEffect extends ActiveMagicEffect  

Event OnEffectStart(Actor Target, Actor Caster)
	HentaiPregnancy HentaiP = Quest.GetQuest("HentaiPregnancyQuest") as HentaiPregnancy
	
	If (!Caster.IsInCombat() && !Caster.IsOnMount() && !Caster.IsInFaction(HentaiP.SexLab.AnimatingFaction))
		if (Caster.IsWeaponDrawn())
			Caster.SheatheWeapon()
		endIf
		If HentaiP.PlayerREF == Caster
			Game.DisablePlayerControls()
		Else
			;disable npc moving
			Caster.Setunconscious(true)
		EndIf

		;prevent other mods form interrupting milking
		HentaiP.SexLab.ForbidActor(Caster)
		Caster.AddToFaction(HentaiP.SexLab.AnimatingFaction)
		
		Debug.SendAnimationEvent(Caster,"hentaipregnancyZaZAPCHorFC")
		
		if Caster.GetFactionRank(HentaiP.HentaiLactatingFaction) > 0
			Caster.ModFactionRank(HentaiP.HentaiLactatingFaction, -1)
			
			if self.GetBaseObject() != HentaiP.HentaiMilkSquirtSpellEffect && Game.GetModbyName("HearthFires.esm") != 255 
				If HentaiP.PlayerREF == Caster
					if HentaiP.config.EnableMessages
						Debug.Notification(HentaiP.Strings.ShowHentaiMilkSquirtEffectStrings(0))
					EndIf
				EndIf
				Caster.AddItem(Game.GetFormFromFile(0x3534, "HearthFires.esm"), 1)
			else
				If HentaiP.PlayerREF == Caster
					if HentaiP.config.EnableMessages
						Debug.Notification(HentaiP.Strings.ShowHentaiMilkSquirtEffectStrings(1))
					EndIf
				EndIf
			endif
			
			if(Utility.RandomInt(0, 1) == 1)	
				HentaiP.playLeftMilkEffect(Caster)
			else
				HentaiP.playRightMilkEffect(Caster)
			endif
		else
			If HentaiP.PlayerREF == Caster
				if HentaiP.config.EnableMessages
					Debug.Notification(HentaiP.Strings.ShowHentaiMilkSquirtEffectStrings(2))
				EndIf
			EndIf
			HentaiP.playNoMilkEffect(Caster)
		endIf
		
		Debug.SendAnimationEvent(Caster, "IdleForceDefaultState")
		
		;allow other mods to animate actor
		HentaiP.SexLab.AllowActor(Caster)
		Caster.RemoveFromFaction(HentaiP.SexLab.AnimatingFaction)

		If HentaiP.PlayerREF == Caster
			Game.EnablePlayerControls()
		Else
			;enable npc moving
			Caster.Setunconscious(false)
		EndIf
	EndIf
endEvent