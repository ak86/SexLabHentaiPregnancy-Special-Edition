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
Faction property HentaiPregnantFaction Auto
Faction property HentaiLactatingFaction Auto
Faction property HentaiFertilityFaction Auto

Spell Property HentaiSoulgemBirthSpell Auto
Spell Property HentaiImpregnation Auto
Spell Property HentaiPregnancyStaggerSpell Auto
Spell Property HentaiPregnancyFearSpell Auto
Spell Property HentaiFertilityBlessingSpell Auto
Spell Property HentaiFertilityCurseSpell Auto

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
	RegisterForModEvent("AnimationStart", "OnSexLabStart")
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
	RegisterForModEvent("AnimationStart", "OnSexLabStart")
	RegisterForModEvent("SexLabOrgasmSeparate", "HentaiPregnancyImpregnateS")
	if Strings.getversion() != 3
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

string function getMotherState(Actor actorToTest)
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getMother() == actorToTest
			return PregnantActors[i].getState()
		endIf
		i += 1
	endWhile
	return "ReadyForPregnancy"
endFunction

int function canMotherInflate(Actor actorToTest)
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getState() != "ReadyForPregnancy" && PregnantActors[i].getMother() == actorToTest
			return i
		endIf
		i += 1
	endWhile
	return -1
endFunction

bool function isNotPregnant(Actor actorToTest)
	;return true if actor is not pregnant(alias not filled)
	;return false if actor is not in ReadyForPregnancy state(alias filled) - cuminflating/pregnancy/postpregnancy
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

function UpdateSize()
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getMother() != none
			PregnantActors[i].recheckBody()
		endIf
		i += 1
	endWhile
endFunction

function UpdateTargetSize()
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getMother() != none
			PregnantActors[i].targetSizeCalc()
		endIf
		i += 1
	endWhile
endFunction

function UpdatePregDuration()
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getMother() != none
			PregnantActors[i].PregDurationCalc()
		endIf
		i += 1
	endWhile
endFunction

function UpdateBreastScaling()
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getMother() != none
			PregnantActors[i].setBreastScaling()
		endIf
		i += 1
	endWhile
endFunction

function UpdateBellyScaling()
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getMother() != none
			PregnantActors[i].setBellyScaling()
		endIf
		i += 1
	endWhile
endFunction

function UpdateBodyWeightScaling()
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getMother() != none
			PregnantActors[i].setBodyWeightScaling()
		endIf
		i += 1
	endWhile
endFunction

bool function ResetScaling()
	int i = 0
	while i < PregnantActors.Length
		if PregnantActors[i].getMother() != none
			ResetBody(PregnantActors[i].getMother())
		endIf
		i += 1
	endWhile
	return true
endFunction

function addTempPregnancyEffects(Actor ActorRef, int hoursleft, bool isvictim)
	if( hoursleft < 48 && hoursleft > 0 && config.PregnancyEffects)
		int random = Utility.RandomInt(0, 10)
		if(random <= 5)
			Utility.Wait(random)
			;ActorRef.SetExpressionOverride(2, 100)
			HentaiPregnancyStaggerSpell.cast(ActorRef)
			SexLab.PickVoice(ActorRef).Moan(ActorRef, 0,5)

			SexLab.ClearMFG(ActorRef)
			if(isvictim)
				;HentaiPregnancyFearSpell.cast(ActorRef)				
			endif
		endif
	endif
endFunction

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
	
	SexLab.ClearMFG(ActorRef)
	EquipItem(ActorRef, stripped, false, false)
endfunction

function playNoMilkEffect(Actor ActorRef)
	;ActorRef.SetExpressionOverride(4, 100)
	
	form stripped = getBodyItem(ActorRef)
	UnequipItem(ActorRef, stripped, true, false)
	SexLab.PickVoice(ActorRef).Moan(ActorRef, 0,5)
	Utility.Wait(12.0)
	
	SexLab.ClearMFG(ActorRef)
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
	
	SexLab.ClearMFG(ActorRef)
	EquipItem(ActorRef, stripped, false, false)
endfunction

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
	;node scale
	if config.BellyScaling
		BodyMod.SetNodeScale(ActorRef, "NPC Belly", 1)
	endif
	if config.BreastScaling
		BodyMod.SetNodeScale(ActorRef, "NPC L Breast", 1)
		BodyMod.SetNodeScale(ActorRef, "NPC R Breast", 1)
	endif
	;morphs scale
	;pregnancy breast
	BodyMod.ClearMorphScale(ActorRef, "BreastsSH")
	BodyMod.ClearMorphScale(ActorRef, "BreastsSSH")
	BodyMod.ClearMorphScale(ActorRef, "BreastGravity")
	BodyMod.ClearMorphScale(ActorRef, "NippleAreola")
	;pregnancy belly
	BodyMod.ClearMorphScale(ActorRef, "ChubbyArms")
	BodyMod.ClearMorphScale(ActorRef, "ChubbyWaist")
	BodyMod.ClearMorphScale(ActorRef, "ChubbyButt")
	BodyMod.ClearMorphScale(ActorRef, "ChubbyLegs")
	BodyMod.ClearMorphScale(ActorRef, "ButtShape2")
	BodyMod.ClearMorphScale(ActorRef, "PregnancyBelly")
	;pregnancy milk
	BodyMod.ClearMorphScale(ActorRef, "DoubleMelon")
	BodyMod.ClearMorphScale(ActorRef, "NipplePerkiness")
	BodyMod.ClearMorphScale(ActorRef, "NippleLength")

	; reset SexLab Inflation Framework  
	int SLIF_unregisterActor = ModEvent.Create("SLIF_unregisterActor")
	if (SLIF_unregisterActor)
		ModEvent.PushForm(SLIF_unregisterActor, ActorRef)
		ModEvent.PushString(SLIF_unregisterActor, "SexLab Hentai Pregnancy")
		ModEvent.Send(SLIF_unregisterActor)
	endif
endFunction

bool function setPregnant(Actor father, Actor mother, bool isvictim, bool fertilised)
	bool ispregnant = false

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
		;pregnancy doesnt exist or mother is cum inflation
		;seed/re-seed her
		if(isNotPregnant(mother)) || getMotherState(mother) == "CumInflated"
			int actorIndex = canMotherInflate(mother)
			if actorIndex == -1
				actorIndex = getPregnancyReadyActorsIndex()
			endif
			;Debug.Notification("Pregnant slot availuable " + actorIndex)
			if(actorIndex > -1)
				;preg all, npc, pc
				if(config.PregnancyActorOption == 0 || PlayerRef != mother && config.PregnancyActorOption == 1 || PlayerRef == mother && config.PregnancyActorOption == 2)
					HentaiPregnantActorAlias pregnancy = PregnantActors[actorIndex]
					pregnancy.ForceRefTo(mother)
					pregnancy.setFather(father)
					pregnancy.setFatherIsCreature(father.HasKeyword( Game.GetFormFromFile(0x13795, "Skyrim.esm") as Keyword ) || father.HasKeyword( Game.GetFormFromFile(0x13798, "Skyrim.esm") as Keyword ))
					pregnancy.setFertilised(fertilised)
					pregnancy.setIsVictim(isvictim)
					CumInflation(actorIndex, father)
					pregnancy.GoToState("Inseminated")
					pregnancy.setId(actorIndex)
					if(fertilised)
						if config.EnableMessages
							Debug.Notification(father.GetDisplayName() + Strings.ShowHentaiPregnancyStrings(1) + mother.GetDisplayName())
						endif
						SoulGemImpregnation(actorIndex, father)
						ispregnant = true
						SendModEvent("HentaiPregnancyImpregnation", actorIndex, pregnancy.getCurrentHour())
					endIf
				endIf
			endIf
		else
			;plant soul gem if mother in pregnant state
			if (fertilised)
				SoulGemImpregnation(isMotherPregnant(mother), father)
			endIf
			;inflate
			CumInflation(canMotherInflate(mother), father)
		endIf
		utility.wait(1.0)
	endIf
	
	return ispregnant
endFunction

function SoulGemImpregnation(int pregnancyID = -1, actor father)
	if config.SoulGemPregnancy && pregnancyID > -1
		HentaiPregnantActorAlias pregnancy = getPregnancyWithID(pregnancyID)
		Actor mother = pregnancy.getMother()
		;bool forced = pregnancy.isVictim()
		;if father != mother 			self/estrus
			if ((father.HasKeyword( Game.GetFormFromFile(0x13795, "Skyrim.esm") as Keyword ) || father.HasKeyword( Game.GetFormFromFile(0x13798, "Skyrim.esm") as Keyword )) || !config.CreaturesOnly)
				if config.EnableMessages
					Debug.Notification(father.GetDisplayName() + Strings.ShowHentaiPregnancyStrings(3) + mother.GetDisplayName())
				EndIf
				pregnancy.setSoulGemCount( pregnancy.getSoulGemCount() + 1)
			endIf
		;endIf
	endIf
endFunction

function CumInflation(int pregnancyID = -1, actor father)
		;Debug.Notification("CumInflation " + pregnancyID)
	if config.CumInflation && pregnancyID > -1 && father != none
		HentaiPregnantActorAlias pregnancy = getPregnancyWithID(pregnancyID)
		Actor mother = pregnancy.getMother()
		float AddCum = config.CumSizeBase
;		Debug.Notification("cum to add " + AddCum)
		AddCum = config.CumSizeBase * (1 + Utility.RandomFloat(-1*config.CumSizeRandomizer, config.CumSizeRandomizer)/100)
;		Debug.Notification("cum to add randomized " + AddCum)
		if (father.HasKeyword( Game.GetFormFromFile(0x13795, "Skyrim.esm") as Keyword ) || father.HasKeyword( Game.GetFormFromFile(0x13798, "Skyrim.esm") as Keyword ))
			AddCum = AddCum * config.CumSizeCreatureModifier
;			Debug.Notification("creature cum to add " + AddCum)
		endIf
		if father == mother
			AddCum = AddCum * config.CumSizeEstrusModifier
;			Debug.Notification("Estrus? " + AddCum)
		endIf
;		Debug.Notification("final cum1 " + pregnancy.getCumInflation())
		pregnancy.setCumInflation(pregnancy.getCumInflation() + AddCum)
;		Debug.Notification("final cum2 " + pregnancy.getCumInflation())
	endIf
endFunction

function SoulGemBirth(int pregnancyID)
	if config.SoulGemPregnancy
		;safety check, pregnancyID should always be > -1
		if (pregnancyID > -1)
			HentaiPregnantActorAlias pregnancy = getPregnancyWithID(pregnancyID)
			form SoulGemType = getSoulGemSize(pregnancyID)

			if SoulGemType != none
				Actor mother = pregnancy.getMother()
				mother.addItem(SoulGemType, pregnancy.getSoulGemCount(), true)	
				pregnancy.setSoulGemCount(0)
			
				if config.EnableMessages
					Debug.Notification(mother.GetDisplayName() + Strings.ShowHentaiPregnancyStrings(4))
				EndIf
			endIf
		endIf
	endIf
endFunction

form function getSoulGemSize(int pregnancyID)
	HentaiPregnantActorAlias pregnancy = getPregnancyWithID(pregnancyID)
	float soulGemSize = (pregnancy.getCurrentHour() - pregnancy.getSoulGemStartHour()) / (config.SoulGemDuration * pregnancy.getSoulGemCount())
	If soulGemSize >= 4 && !pregnancy.getFatherIsCreature()
		return SoulGemBlackFilled
	elseIf soulGemSize >= 4
		return SoulGemGrandFilled
	elseIf soulGemSize >= 3
		return SoulGemGreaterFilled
	elseIf soulGemSize >= 2
		return SoulGemLesserFilled
	elseif soulGemSize >= 1
		return SoulGemPettyFilled
	endIf
	Int i = Utility.RandomInt(1,5)
	if i == 1
		return 	Game.GetFormFromFile(0x67181, "skyrim.esm")
	elseif i == 2
		return 	Game.GetFormFromFile(0x67182, "skyrim.esm")
	elseif i == 3
		return 	Game.GetFormFromFile(0x67183, "skyrim.esm")
	elseif i == 4
		return 	Game.GetFormFromFile(0x67184, "skyrim.esm")
	elseif i == 5
		return 	Game.GetFormFromFile(0x67185, "skyrim.esm")
	endif
	return none
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
;		if(pregnancyId > -1)
;			HentaiPregnantActorAlias pregnancy = getPregnancyWithID(pregnancyID)
;			pregnancy.deflateBelly()
;		endif
	
	if(config.ChildChance != 0 && pregnancyId > -1); && duration != 0 
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
	SexLab.ClearMFG(ActorRef)
	SexLab.AllowActor(ActorRef)
	ActorRef.RemoveFromFaction(SexLab.AnimatingFaction)
endFunction

function NpcMilking(Actor Caster)
	If (!Caster.IsInCombat() && !Caster.IsOnMount() && !Caster.IsInFaction(SexLab.AnimatingFaction))
		if (Caster.IsWeaponDrawn())
			Caster.SheatheWeapon()
		endIf
		Caster.Setunconscious(true)

		;prevent other mods form interrupting milking
		SexLab.ForbidActor(Caster)
		Caster.AddToFaction(SexLab.AnimatingFaction)
		
		Debug.SendAnimationEvent(Caster,"hentaipregnancyZaZAPCHorFC")
		
		if Caster.GetFactionRank(HentaiLactatingFaction) > 0
			if(Utility.RandomInt(0, 1) == 1)	
				playLeftMilkEffect(Caster)
			else
				playRightMilkEffect(Caster)
			endif
			
			int howmuchtomilk = 1
			if config.MilkAllNPC
				howmuchtomilk = Caster.GetFactionRank(HentaiLactatingFaction)
			endif
			
			Caster.ModFactionRank(HentaiLactatingFaction, -howmuchtomilk)
			
			if Game.GetModbyName("HearthFires.esm") != 255 
				Caster.AddItem(Game.GetFormFromFile(0x3534, "HearthFires.esm"), howmuchtomilk)
			endif
		else
			playNoMilkEffect(Caster)
		endIf
		
		int i = 0
		while i < PregnantActors.Length
				if PregnantActors[i].GetActorRef() == Caster
					PregnantActors[i].setMilk(PregnantActors[i].getMilk())
					i = PregnantActors.Length
				endIf
			i += 1
		endWhile
		
		Debug.SendAnimationEvent(Caster, "IdleForceDefaultState")
		
		;allow other mods to animate actor
		SexLab.AllowActor(Caster)
		Caster.RemoveFromFaction(SexLab.AnimatingFaction)

		;enable npc moving
		Caster.Setunconscious(false)
	EndIf
endFunction

String Function getAnimName(String _argString)
	sslBaseAnimation animation = SexLab.HookAnimation(_argString)

	If animation
		Return animation.Name
	EndIf
	return ""
EndFunction

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

Event OnSexLabStart(String _eventName, String _args, Float _argc, Form _sender)
	Actor[] actors = SexLab.HookActors(_args)											;0 - actor being sucked, 1 - actor sucking
	String  animName = getAnimName(_args)

	if (animName == "3J Straight Breastfeeding"\
	|| animName == "3J Lesbian Breastfeeding"\
	|| animName == "3Jiou Breastfeeding Lesbian"\
	|| animName == "3Jiou Breastfeeding Straight")

		if actors[0].GetFactionRank(HentaiLactatingFaction) > 0
;			maybe redo into spell and add leaking effects later?
;			if(Utility.RandomInt(0, 1) == 1)	
;				playLeftMilkEffect(actors[0])
;			else
;				playRightMilkEffect(actors[0])
;			endif
			actors[0].ModFactionRank(HentaiLactatingFaction, -1)
			;feed milk jug
			if Game.GetModbyName("HearthFires.esm") != 255 
				actors[1].equipitem(Game.GetFormFromFile(0x3534, "HearthFires.esm"), true, true)
			endif
			int i = 0
			while i < PregnantActors.Length
					if PregnantActors[i].GetActorRef() == actors[0]
						PregnantActors[i].setMilk(PregnantActors[i].getMilk())
						i = PregnantActors.Length
					endIf
				i += 1
			endWhile
			if config.EnableMessages
				Debug.Notification(actors[0].GetDisplayName() + Strings.ShowHentaiPregnancyStrings(8) + actors[1].GetDisplayName())
				if actors[0].GetFactionRank(HentaiLactatingFaction) > 0
					Debug.Notification(actors[0].GetDisplayName() +  Strings.ShowHentaiPregnancyStrings(9))
				endif
			endif
		endif
	endif
EndEvent

Event HentaiPregnancyImpregnate(string eventName, string argString, float argNum, form sender)
	Actor[] actorList = SexLab.HookActors(argString)
	sslThreadController controller = SexLab.HookController(argString)
	sslBaseAnimation anim = SexLab.HookAnimation(argString)
	
	;impregnate if:
	;-more than 1 actor and
	;-separate orgasm disabled
	;-or slso always orgasm enabled
	if actorList.Length > 1\
	&& (!SexLab.config.SeparateOrgasms || JsonUtil.GetIntValue("/SLSO/Config", "sl_default_always_orgasm") == 1 || (!controller.HasPlayer && JsonUtil.GetIntValue("/SLSO/Config", "sl_npcscene_always_orgasm") == 1))

		int MaleIndex = -1
		int FemaleIndex = -1
		int i = 0
		while (i < actorList.Length)
			if SexLab.GetGender(actorList[i])== 0 || treatAsMale(actorList[i], controller, anim)
				MaleIndex = i
			elseif FemaleIndex == -1 && (actorList[i].GetLeveledActorBase().GetSex() == 1 || (anim.HasTag("Anal") && config.AllowAnal))
				FemaleIndex = i			
			endIf
			i += 1
		endWhile
		
		;int random = Utility.RandomInt(0, 100)
		;Caster.GetFactionRank(HentaiFertilityFaction) > 0
		int random = Utility.RandomInt(0, 100)
		int chance = -1
		Actor victim = SexLab.HookVictim(argString)

		if (MaleIndex >= 0 && FemaleIndex >= 0)
			if(anim.HasTag("Creature") || anim.HasTag("Vaginal") || (anim.HasTag("Anal") && config.AllowAnal))
				chance = config.PregnancyChance + StorageUtil.GetIntValue(actorList[FemaleIndex], "hp_fetility_modifier", 0)
			endIf
			setPregnant(actorList[MaleIndex], actorList[FemaleIndex], victim != none, random <= chance)
		else
			;Debug.Notification("could not find male ")
		endIf
	elseif anim.HasTag("Estrus")
		setPregnant(actorList[0], actorList[0], true, false)
		;Debug.Notification("actorList.Length <=1 ")
	endIf
EndEvent

Event HentaiPregnancyImpregnateS(Form ActorRef, Int Thread)
	actor akActor = ActorRef as actor
	string id = Thread as string
	Actor[] actorList = SexLab.HookActors(id)
	sslThreadController controller = SexLab.HookController(id)
	sslBaseAnimation anim = SexLab.HookAnimation(id)
	
	;impregnate if:
	;-more than 1 actor and
	;-separate orgasm enabled
	;-orgasming actor not in recieving/female position (0)
	if actorList.Length > 1 && akActor != actorList[0] && SexLab.config.SeparateOrgasms
	
		int MaleIndex = -1
		int FemaleIndex = -1
		int i = 0
		while (i < actorList.Length)
			if SexLab.GetGender(actorList[i])== 0 || treatAsMale(actorList[i], controller, anim)
				MaleIndex = i
			elseif FemaleIndex == -1 && (actorList[i].GetLeveledActorBase().GetSex() == 1 || (anim.HasTag("Anal") && config.AllowAnal))
				FemaleIndex = i			
			endIf
			i += 1
		endWhile
		
		int random = Utility.RandomInt(0, 100)
		int chance = -1
		;int chance = akActor.GetFactionRank(HentaiFertilityFaction)
		Actor victim = SexLab.HookVictim(id)

		if (MaleIndex >= 0 && FemaleIndex >= 0)
			if(anim.HasTag("Creature") || anim.HasTag("Vaginal") || (anim.HasTag("Anal") && config.AllowAnal))
				chance = config.PregnancyChance + StorageUtil.GetIntValue(actorList[FemaleIndex], "hp_fetility_modifier", 0)
			endIf
			setPregnant(actorList[MaleIndex], actorList[FemaleIndex], victim != none, random <= chance)
		else
			;Debug.Notification("could not find male ")
		endIf
	elseif anim.HasTag("Estrus")
		setPregnant(actorList[0], actorList[0], true, false)
		;Debug.Notification("actorList.Length <=1 ")
	endIf
EndEvent
