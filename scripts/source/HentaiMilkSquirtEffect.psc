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
		
		int i = 0
		while i < HentaiP.PregnantActors.Length
				if HentaiP.PregnantActors[i].GetActorRef() == Caster
					int t = HentaiP.PregnantActors[i].getMilk()
					if t > 0
						t = HentaiP.PregnantActors[i].setMilk(t - 1)
						
						if self.GetBaseObject() != HentaiP.HentaiMilkSquirtSpellEffect && Game.GetModbyName("HearthFires.esm") != 255 
							If HentaiP.PlayerREF == Caster
								Debug.Notification(HentaiP.Strings.ShowHentaiMilkSquirtEffectStrings(0))
							EndIf
							Caster.AddItem(Game.GetFormFromFile(0x3534, "HearthFires.esm"), 1)
						else
							If HentaiP.PlayerREF == Caster
								Debug.Notification(HentaiP.Strings.ShowHentaiMilkSquirtEffectStrings(1))
							EndIf
						endif
						
						if(Utility.RandomInt(0, 1) == 1)	
							HentaiP.playLeftMilkEffect(Caster)
						else
							HentaiP.playRightMilkEffect(Caster)
						endif
					else
						If HentaiP.PlayerREF == Caster
							Debug.Notification(HentaiP.Strings.ShowHentaiMilkSquirtEffectStrings(2))
						EndIf
						HentaiP.playNoMilkEffect(Caster)
					endIf
				endIf
			i += 1
		endWhile
		
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