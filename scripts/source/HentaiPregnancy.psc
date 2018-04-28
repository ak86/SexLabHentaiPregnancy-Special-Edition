Scriptname HentaiPregnancy extends Quest

HentaiPregnancyConfig Property config Auto
SexLabFramework Property SexLab Auto
HentaiPregnancy_BodyMod Property BodyMod Auto
HentaiPregnancy_Strings Property Strings Auto

Actor Property PlayerRef Auto

Armor Property HentaiAmnioticFluid Auto
Armor Property HentaiPregnancyMilkR Auto
Armor Property HentaiPregnancyMilkL Auto

FormList Property HentaiMilkSquirtSpellList Auto
Form Property HentaiMilkSquirtBYOHBottle Auto

Spell Property HentaiSoulgemBirthSpell Auto
Spell Property HentaiImpregnation Auto
Spell Property HentaiPregnancyStaggerSpell Auto
Spell Property HentaiPregnancyFearSpell Auto

EffectShader property HentaiPregnancyMilkCBBE auto
EffectShader property HentaiPregnancyMilkUNP auto
MagicEffect Property HentaiMilkSquirtSpellEffect Auto

SoulGem Property SoulGemBlackFilled Auto
SoulGem Property SoulGemGrandFilled Auto
SoulGem Property SoulGemGreaterFilled Auto
SoulGem Property SoulGemLesserFilled Auto
SoulGem Property SoulGemPettyFilled Auto

HentaiPregnantActorAlias Property PregnantActor00 Auto
HentaiPregnantActorAlias Property PregnantActor01 Auto
HentaiPregnantActorAlias Property PregnantActor02 Auto
HentaiPregnantActorAlias Property PregnantActor03 Auto
HentaiPregnantActorAlias Property PregnantActor04 Auto
HentaiPregnantActorAlias Property PregnantActor05 Auto
HentaiPregnantActorAlias Property PregnantActor06 Auto
HentaiPregnantActorAlias Property PregnantActor07 Auto
HentaiPregnantActorAlias Property PregnantActor08 Auto
HentaiPregnantActorAlias Property PregnantActor09 Auto
HentaiPregnantActorAlias Property PregnantActor10 Auto
HentaiPregnantActorAlias Property PregnantActor11 Auto
HentaiPregnantActorAlias Property PregnantActor12 Auto
HentaiPregnantActorAlias Property PregnantActor13 Auto
HentaiPregnantActorAlias Property PregnantActor14 Auto
HentaiPregnantActorAlias Property PregnantActor15 Auto
HentaiPregnantActorAlias Property PregnantActor16 Auto
HentaiPregnantActorAlias Property PregnantActor17 Auto
HentaiPregnantActorAlias Property PregnantActor18 Auto
HentaiPregnantActorAlias Property PregnantActor19 Auto
HentaiPregnantActorAlias Property PregnantActor20 Auto
HentaiPregnantActorAlias Property PregnantActor21 Auto
HentaiPregnantActorAlias Property PregnantActor22 Auto
HentaiPregnantActorAlias Property PregnantActor23 Auto
HentaiPregnantActorAlias Property PregnantActor24 Auto
HentaiPregnantActorAlias Property PregnantActor25 Auto
HentaiPregnantActorAlias Property PregnantActor26 Auto
HentaiPregnantActorAlias Property PregnantActor27 Auto
HentaiPregnantActorAlias Property PregnantActor28 Auto
HentaiPregnantActorAlias Property PregnantActor29 Auto
HentaiPregnantActorAlias Property PregnantActor30 Auto
HentaiPregnantActorAlias Property PregnantActor31 Auto
HentaiPregnantActorAlias Property PregnantActor32 Auto
HentaiPregnantActorAlias Property PregnantActor33 Auto
HentaiPregnantActorAlias Property PregnantActor34 Auto
HentaiPregnantActorAlias Property PregnantActor35 Auto
HentaiPregnantActorAlias Property PregnantActor36 Auto
HentaiPregnantActorAlias Property PregnantActor37 Auto
HentaiPregnantActorAlias Property PregnantActor38 Auto
HentaiPregnantActorAlias Property PregnantActor39 Auto
HentaiPregnantActorAlias Property PregnantActor40 Auto
HentaiPregnantActorAlias Property PregnantActor41 Auto
HentaiPregnantActorAlias Property PregnantActor42 Auto
HentaiPregnantActorAlias Property PregnantActor43 Auto
HentaiPregnantActorAlias Property PregnantActor44 Auto
HentaiPregnantActorAlias Property PregnantActor45 Auto
HentaiPregnantActorAlias Property PregnantActor46 Auto
HentaiPregnantActorAlias Property PregnantActor47 Auto
HentaiPregnantActorAlias Property PregnantActor48 Auto
HentaiPregnantActorAlias Property PregnantActor49 Auto
HentaiPregnantActorAlias[] Property PregnantActors Auto hidden

Event OnInit()
	setUpPregnantActors()
	RegisterForModEvent("OrgasmStart", "HentaiPregnancyImpregnate")
	RegisterForModEvent("SexLabOrgasmSeparate", "HentaiPregnancyImpregnateS")
	if config.EnableMessages
		Debug.Notification("Hentai Pregnancy Ready")
	endif
	Strings.ResetStrings()
EndEvent

function gameLoaded()
	UnregisterForModEvent("OrgasmStart")
	UnregisterForModEvent("SexLabOrgasmSeparate")
	if PregnantActors.find(none) > -1
		setUpPregnantActors()
	endif
	RegisterForModEvent("OrgasmStart", "HentaiPregnancyImpregnate")
	RegisterForModEvent("SexLabOrgasmSeparate", "HentaiPregnancyImpregnateS")
	if Strings.getversion() != 1
		Debug.Notification("HentaiPregnancy translation script outdated")
	endif
	
	Strings.ResetStrings()
	
endFunction

function setUpPregnantActors()

	PregnantActors = new HentaiPregnantActorAlias[50]
	PregnantActors[0] = PregnantActor00
	PregnantActors[1] = PregnantActor01
	PregnantActors[2] = PregnantActor02
	PregnantActors[3] = PregnantActor03
	PregnantActors[4] = PregnantActor04
	PregnantActors[5] = PregnantActor05
	PregnantActors[6] = PregnantActor06
	PregnantActors[7] = PregnantActor07
	PregnantActors[8] = PregnantActor08
	PregnantActors[9] = PregnantActor09
	PregnantActors[10] = PregnantActor10
	PregnantActors[11] = PregnantActor11
	PregnantActors[12] = PregnantActor12
	PregnantActors[13] = PregnantActor13
	PregnantActors[14] = PregnantActor14
	PregnantActors[15] = PregnantActor15
	PregnantActors[16] = PregnantActor16
	PregnantActors[17] = PregnantActor17
	PregnantActors[18] = PregnantActor18
	PregnantActors[19] = PregnantActor19
	PregnantActors[20] = PregnantActor20
	PregnantActors[21] = PregnantActor21
	PregnantActors[22] = PregnantActor22
	PregnantActors[23] = PregnantActor23
	PregnantActors[24] = PregnantActor24
	PregnantActors[25] = PregnantActor25
	PregnantActors[26] = PregnantActor26
	PregnantActors[27] = PregnantActor27
	PregnantActors[28] = PregnantActor28
	PregnantActors[29] = PregnantActor29
	PregnantActors[30] = PregnantActor30
	PregnantActors[31] = PregnantActor31
	PregnantActors[32] = PregnantActor32
	PregnantActors[33] = PregnantActor33
	PregnantActors[34] = PregnantActor34
	PregnantActors[35] = PregnantActor35
	PregnantActors[36] = PregnantActor36
	PregnantActors[37] = PregnantActor37
	PregnantActors[38] = PregnantActor38
	PregnantActors[39] = PregnantActor39
	PregnantActors[40] = PregnantActor40
	PregnantActors[41] = PregnantActor41
	PregnantActors[42] = PregnantActor42
	PregnantActors[43] = PregnantActor43
	PregnantActors[44] = PregnantActor44
	PregnantActors[45] = PregnantActor45
	PregnantActors[46] = PregnantActor46
	PregnantActors[47] = PregnantActor47
	PregnantActors[48] = PregnantActor48
	PregnantActors[49] = PregnantActor49

endFunction

HentaiPregnantActorAlias function getPregnancyWithID(int id)
	if(id > -1)
		return PregnantActors[id]
	endif
	return none
endFunction

int function getPregnancyReadyActorsIndex()
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getState() == "ReadyForPregnancy"
			return i
		endIf
		i += 1
	endWhile
	return -1
endFunction

int function isMotherPregnant(Actor actorToTest)
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getState() == "Pregnant" && PregnantActors[i].getMother() == actorToTest
			return i
		endIf
		i += 1
	endWhile
	return -1
endFunction

bool function isNotPregnant(Actor actorToTest)
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getState() != "ReadyForPregnancy" && PregnantActors[i].getMother() == actorToTest
			return false
		endIf
		i += 1
	endWhile
	return true
endFunction

function clearPregnancies()
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getState() != "ReadyForPregnancy"
			PregnantActors[i].GoToState("ClearPregnancy")
		endIf
		i += 1
	endWhile
	config.pregnanciesCleared()
	Debug.Notification(Strings.ShowHentaiPregnancyStrings(0))
endFunction

bool function setPregnant(Actor father, Actor mother, bool isvictim, bool fertilised)
	bool ispregnant = false
	bool BreastScaling = true
	bool BellyScaling = true
	
	;Skeleton check	
	if !NetImmerse.HasNode(mother, "NPC L Breast", false)
		Debug.Notification("HP:" + mother.GetLeveledActorBase().GetName() + Strings.ShowHentaiPregnancyStrings(5))
		BreastScaling = false
	endIf
	if !NetImmerse.HasNode(mother, "NPC R Breast", false)
		Debug.Notification("HP:" + mother.GetLeveledActorBase().GetName() + Strings.ShowHentaiPregnancyStrings(6))
		BreastScaling = false
	endIf
	if !NetImmerse.HasNode(mother, "NPC Belly", false)
		Debug.Notification("HP:" + mother.GetLeveledActorBase().GetName() + Strings.ShowHentaiPregnancyStrings(7))
		BellyScaling = false
	endIf

	;Disable fertilisation(pregnancy) if target already pregnant with below mods, cuminflation will still work
	;Estrus Chaurus+
		if mother.HasSpell( Game.GetFormFromFile(0x19121, "EstrusChaurus.esp") as Spell )		;ChaurusBreeder spell
			fertilised = false
		endif
		if mother.HasKeyword( Game.GetFormFromFile(0x160A8, "EstrusChaurus.esp") as Keyword )	;zzEstrusParasite Keyword
			fertilised = false
		endif
	
	;Estrus Spider+
		if mother.HasSpell( Game.GetFormFromFile(0x4e255, "EstrusSpider.esp") as Spell )		;SpiderBreeder spell
			fertilised = false
		endif
		if mother.HasKeyword( Game.GetFormFromFile(0x4F2A3, "EstrusSpider.esp") as Keyword )	;zzEstrusSpiderParasiteKWD Keyword
			fertilised = false
		endif
	
	;Estrus Dwemer+
		if mother.HasSpell( Game.GetFormFromFile(0x4e255, "EstrusDwemer.esp") as Spell )		;DwemerBreeder spell
			fertilised = false
		endif
		if mother.HasKeyword( Game.GetFormFromFile(0x4F2A3, "EstrusDwemer.esp") as Keyword )	;zzEstrusDwemerParasiteKWD Keyword
			fertilised = false
		endif

	if (mother.GetLeveledActorBase().IsUnique() || config.AllowNonUnique)
		if(isNotPregnant(mother))
			int actorIndex = getPregnancyReadyActorsIndex()
			;Debug.Notification("Pregnant slot availuable " + actorIndex)
			if(actorIndex > -1)
				if(PlayerRef != mother || config.PregnancyActorOption == 0)
					HentaiPregnantActorAlias pregnancy = PregnantActors[actorIndex]
					pregnancy.ForceRefTo(mother)
					pregnancy.setFather(father)
					pregnancy.setFaterIsCreature(father.HasKeyword( Game.GetFormFromFile(0x13795, "Skyrim.esm") as Keyword ) || father.HasKeyword( Game.GetFormFromFile(0x13798, "Skyrim.esm") as Keyword ))
					pregnancy.setBreastScaling(BreastScaling)
					pregnancy.setBellyScaling(BellyScaling)
					pregnancy.setFertilised(fertilised)
					pregnancy.setIsVictim(isvictim)
					pregnancy.GoToState("Inseminated")
					pregnancy.setId(actorIndex)
					if(fertilised)
						if config.EnableMessages
							Debug.Notification(father.GetLeveledActorBase().GetName() + Strings.ShowHentaiPregnancyStrings(1) + mother.GetLeveledActorBase().GetName())
						endif
						ispregnant = true
						SendModEvent("HentaiPregnancyImpregnation", actorIndex, pregnancy.getCurrentHour())
					endIf
				endIf
			endIf
		elseif (fertilised)
			SoulGemImpregnation(isMotherPregnant(mother))
		endIf
;	elseIf mother.AddSpell(HentaiImpregnation, false)
;		if config.EnableMessages
;			Debug.Notification(father.GetLeveledActorBase().GetName() + Strings.ShowHentaiPregnancyStrings(2) + mother.GetLeveledActorBase().GetName())
;		endif
	endIf
	return ispregnant
endFunction

bool function treatAsMale(actor position, sslThreadController controller, sslBaseAnimation anim)
	int slot = controller.GetPosition(position)
	if SexLab.GetGender(position) == 1
		if anim.GetGender(slot) == 0 && SexLab.Config.bAllowFFCum
			return true
		endIf
	elseif SexLab.GetGender(position) == 2 || SexLab.GetGender(position) == 0
		return true
	endIf
	return false
endFunction

Event HentaiPregnancyImpregnate(string eventName, string argString, float argNum, form sender)

	Actor[] actorList = SexLab.HookActors(argString)
	sslThreadController controller = SexLab.HookController(argString)
	sslBaseAnimation anim = SexLab.HookAnimation(argString)
					
	if actorList.Length > 1

		int MaleIndex = -1
		int FemaleIndex = -1
		int i = 0
		while (i < actorList.Length)
			if SexLab.GetGender(actorList[i])== 0 || treatAsMale(actorList[i], controller, anim)
				MaleIndex = i
			elseif actorList[i].GetLeveledActorBase().GetSex() == 1
				FemaleIndex = i			
			endIf
			i += 1
		endWhile
		
		int random = Utility.RandomInt(0, 100)
		int chance = config.PregnancyChance

		if (MaleIndex >= 0 && FemaleIndex >= 0)
			if(anim.HasTag("Creature") || anim.HasTag("Vaginal") || (anim.HasTag("Anal") && config.AllowAnal))
				Actor victim = SexLab.HookVictim(argString)
				setPregnant(actorList[MaleIndex], actorList[FemaleIndex], victim != none, random <= chance)
			endIf
		else
			;Debug.Notification("could not find male ")
		endIf
		
	else
		;Debug.Notification("actorList.Length <=1 ")
	endIf
	
EndEvent

Event HentaiPregnancyImpregnateS(Form ActorRef, Int Thread)
	actor akActor = ActorRef as actor
	string id = Thread as string
	Actor[] actorList = SexLab.HookActors(id)
	sslThreadController controller = SexLab.HookController(id)
	sslBaseAnimation anim = SexLab.HookAnimation(id)
					
	if actorList.Length > 1 && akActor != actorList[0]

		int MaleIndex = -1
		int FemaleIndex = -1
		int i = 0
		while (i < actorList.Length)
			if SexLab.GetGender(actorList[i])== 0 || treatAsMale(actorList[i], controller, anim)
				MaleIndex = i
			elseif actorList[i].GetLeveledActorBase().GetSex() == 1
				FemaleIndex = i			
			endIf
			i += 1
		endWhile
		
		int random = Utility.RandomInt(0, 100)
		int chance = config.PregnancyChance

		if (MaleIndex >= 0 && FemaleIndex >= 0)
			if(anim.HasTag("Creature") || anim.HasTag("Vaginal") || (anim.HasTag("Anal") && config.AllowAnal))
				Actor victim = SexLab.HookVictim(id)
				setPregnant(actorList[MaleIndex], actorList[FemaleIndex], victim != none, random <= chance)
			endIf
		else
			;Debug.Notification("could not find male ")
		endIf
		
	else
		;Debug.Notification("actorList.Length <=1 ")
	endIf
	
EndEvent

function SoulGemImpregnation(int pregnancyID = -1)

	if config.SoulGemPregnancy && pregnancyID > -1
		HentaiPregnantActorAlias pregnancy = getPregnancyWithID(pregnancyID)
		Actor mother = pregnancy.getMother()
		Actor father = pregnancy.getFather()
		bool forced = pregnancy.isVictim()
		if (pregnancy.getFaterIsCreature() || !config.CreaturesOnly)
			pregnancy.setSoulGemCount( pregnancy.getSoulGemCount() + 1)
			Debug.Notification(father.GetLeveledActorBase().GetName() + Strings.ShowHentaiPregnancyStrings(3) + mother.GetLeveledActorBase().GetName())
		endIf
	endIf
	
endFunction

function SoulGemBirth(int pregnancyID, float durationHours)

	if config.SoulGemPregnancy
		;safety check, pregnancyID should always be > -1
		if (pregnancyID > -1)

			HentaiPregnantActorAlias pregnancy = getPregnancyWithID(pregnancyID)
			Actor mother = pregnancy.getMother()
		
			;duration in hours
			int iPregnancyDuration = durationHours as int
			
			;safety check, config.SoulGemDuration should always be > 0
			if config.SoulGemDuration > 0 && (pregnancy.getFaterIsCreature() || !config.CreaturesOnly)
			
				float soulGemSize = iPregnancyDuration / config.SoulGemDuration / pregnancy.getSoulGemCount()
				If soulGemSize > 4 && !pregnancy.getFaterIsCreature()
					mother.addItem(SoulGemBlackFilled, pregnancy.getSoulGemCount(), true)	
				elseIf soulGemSize > 4
					mother.addItem(SoulGemGrandFilled, pregnancy.getSoulGemCount(), true)	
				elseIf soulGemSize > 3
					mother.addItem(SoulGemGreaterFilled, pregnancy.getSoulGemCount(), true)
				elseIf soulGemSize > 2
					mother.addItem(SoulGemLesserFilled, pregnancy.getSoulGemCount(), true)												
				elseif soulGemSize > 1
					mother.addItem(SoulGemPettyFilled, pregnancy.getSoulGemCount(), true)
				endIf
				
				if soulGemSize > 1
					Debug.Notification(mother.GetLeveledActorBase().GetName() + Strings.ShowHentaiPregnancyStrings(4))
				endIf
			
			endIf
		
		endIf
	endIf
	
endFunction

function endPregnancy(Actor ActorRef, int pregnancyId, bool isvictim, int duration)

		int random = Utility.RandomInt(0, 10)
		Utility.Wait(random)
	
		if(ActorRef.IsWeaponDrawn())
			ActorRef.SheatheWeapon()
		endIf
		
		if(ActorRef.IsInCombat())
			ActorRef.StopCombat()
		endIf		
		
		;ActorRef.SetGhost(true)
		;ActorRef.SetRestrained(true)
		
		;prevent other mods form interrupting birthing
		SexLab.ForbidActor(ActorRef)
		ActorRef.AddToFaction(SexLab.AnimatingFaction)

		EquipItem(ActorRef, HentaiAmnioticFluid, true, true)
		form stripped = getBodyItem(ActorRef)
		UnequipItem(ActorRef, stripped, true, false)	
		
		playMilkLeak(ActorRef, 20)
		
		Debug.SendAnimationEvent(ActorRef, "IdleForceDefaultState")
		
		Debug.SendAnimationEvent(ActorRef, "BleedOutStart")
		
		Utility.Wait( 1.0 )
		
		SexLab.PickVoice(ActorRef).Moan(ActorRef, 1, isvictim)

		Utility.Wait( 15.0 )
		
		if(config.ChildChance != 0 && pregnancyId > -1)
			random = Utility.RandomInt(0, 100)
			Int chance = config.ChildChance
			if( random < chance)
				SendModEvent("HentaiPregnancyBirth", pregnancyId, duration)
			endIf
		endif
		
		Debug.SendAnimationEvent(ActorRef, "BleedOutStop")

		Utility.Wait(2.0)

		UnequipItem(ActorRef, HentaiAmnioticFluid, false, true)
		
		;ActorRef.SetRestrained(false)
		;ActorRef.SetGhost(false)
		EquipItem(ActorRef, stripped, false, false)
		
		;allow other mods to animate actor
		SexLab.AllowActor(ActorRef)
		ActorRef.RemoveFromFaction(SexLab.AnimatingFaction)
	
endFunction

function addTempPregnancyEffects(Actor ActorRef, int hoursleft, bool isvictim)
	if( hoursleft < 48 && hoursleft > 0 && config.PregnancyEffects)
		int random = Utility.RandomInt(0, 10)
		if(random <= 5)
			Utility.Wait(random)
			;ActorRef.SetExpressionOverride(2, 100)
			HentaiPregnancyStaggerSpell.cast(ActorRef)
			SexLab.PickVoice(ActorRef).Moan(ActorRef, 0,5)

			if(isvictim)
				;HentaiPregnancyFearSpell.cast(ActorRef)				
			endif
		endif
	endif
endFunction

function playMilkLeak(Actor ActorRef, int duration)
	if(config.BodyTypeOption == 2)
		HentaiPregnancyMilkUNP.play(ActorRef, duration)
	elseif(config.BodyTypeOption == 1)
		HentaiPregnancyMilkCBBE.play(ActorRef, duration)
	else
		;none
	endif
endFunction

function playLeftMilkEffect(Actor ActorRef)
	playMilkLeak(ActorRef, 20)
	EquipItem(ActorRef, HentaiPregnancyMilkL, true, true)
	;ActorRef.SetExpressionOverride(4, 100)
	
	form stripped = getBodyItem(ActorRef)
	UnequipItem(ActorRef, stripped, true, false)
	SexLab.PickVoice(ActorRef).Moan(ActorRef, 0,5)
	Utility.Wait(8.0)

	UnequipItem(ActorRef, HentaiPregnancyMilkL, false, true)
	Utility.Wait(4.0)
	
	EquipItem(ActorRef, stripped, false, false)
endfunction

function playNoMilkEffect(Actor ActorRef)
	;ActorRef.SetExpressionOverride(4, 100)
	
	form stripped = getBodyItem(ActorRef)
	UnequipItem(ActorRef, stripped, true, false)
	SexLab.PickVoice(ActorRef).Moan(ActorRef, 0,5)
	Utility.Wait(12.0)
	
	EquipItem(ActorRef, stripped, false, false)
endfunction

function playRightMilkEffect(Actor ActorRef)
	playMilkLeak(ActorRef, 20)
	EquipItem(ActorRef, HentaiPregnancyMilkR, true, true)
	;ActorRef.SetExpressionOverride(4, 100)
	
	form stripped = getBodyItem(ActorRef)
	UnequipItem(ActorRef, stripped, true, false)
	SexLab.PickVoice(ActorRef).Moan(ActorRef, 0,5)
	Utility.Wait(8.0)
	
	UnequipItem(ActorRef, HentaiPregnancyMilkR, false, true)
	Utility.Wait(4.0)
	
	EquipItem(ActorRef, stripped, false, false)
endfunction

function addTempPostPregnancyEffects(Actor ActorRef, int hoursleft)
	if( hoursleft > 0 && config.PostPregnancyEffects)		
		int random = Utility.RandomInt(0, 9)
		if(random < 5)	
			Utility.Wait(random)
			random = Utility.RandomInt(0, 9)

			if(random < 5)	
				playLeftMilkEffect(ActorRef)
			else
				playRightMilkEffect(ActorRef)
			endif
			
		endif	
	endif
endFunction

form function getBodyItem(actor a)
	
	int mask = armor.GetMaskForSlot(32)
	armor item = a.GetWornForm(mask) as armor

	return item
endFunction

function UnequipItem(actor a, form item, bool force, bool remove)
	if item != none
		if a.IsEquipped(item)
			a.UnequipItem(item, force, true)
		endif
		if remove
			a.RemoveItem(item, 1, true)
		endif		
	endIf 
endFunction

function EquipItem(actor a, form item, bool force, bool add)
	if item != none
		if add
			a.addItem(item, 1, true)
		endif
		if !a.IsEquipped(item)
			a.EquipItem(item, force, true)	
		endif
	endIf 
endFunction

function clearSinglePregnancy(int index)
	if PregnantActors[index].getState() != "ReadyForPregnancy"
		PregnantActors[index].GoToState("ClearPregnancy")
	endIf		
endFunction

function ResetBody(Actor ActorRef)
	BodyMod.SetNodeScale(ActorRef, "NPC Belly", 1)
	BodyMod.SetNodeScale(ActorRef, "NPC L Breast", 1)
	BodyMod.SetNodeScale(ActorRef, "NPC R Breast", 1)

	; reset SexLab Inflation Framework  
	int SLIF_unregisterActor = ModEvent.Create("SLIF_unregisterActor")
	if (SLIF_unregisterActor)
		ModEvent.PushForm(SLIF_unregisterActor, ActorRef)
		ModEvent.PushString(SLIF_unregisterActor, "SexLab Hentai Pregnancy")
		ModEvent.Send(SLIF_unregisterActor)
	endif
endFunction

