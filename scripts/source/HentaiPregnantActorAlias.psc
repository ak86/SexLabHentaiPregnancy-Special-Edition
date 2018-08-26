Scriptname HentaiPregnantActorAlias extends ReferenceAlias  

HentaiPregnancy Property HentaiP Auto

Actor Property ActorRef Auto
Actor Property FatherRef Auto

;pregnancy breast
;pregnancy/soulgem belly
Float CurrentBreastSize = 1.0
Float CurrentBellySize = 1.0

Float IncrBreastRate = 0.0
Float IncrBellyRate = 0.0

Int pregnancyId = -1
Int DurationHours = 0
Int PostDurationHours = 0
Int CurrentHour = 0
Int SoulGemStartHour = 0
Int Milk = 0
Int SoulGemCount = 0

;pregnancy max breast
;pregnancy/soulgem max belly
float TargetBreastSize = 0.0
float TargetBellySize = 0.0

float lastGameTime = 0.0
float CumInflation = 0.0

bool isvictim = false
bool fertilised = false
bool FatherIsCreature = false
bool BreastScaling = true
bool BellyScaling = true

Event OnInit()
	GoToState("ReadyForPregnancy")
EndEvent

auto State ReadyForPregnancy
	Event OnBeginState()
		if ActorRef != none
			ActorRef.RemoveFromFaction(HentaiP.HentaiPregnantFaction)
			ActorRef.RemoveFromFaction(HentaiP.HentaiLactatingFaction)
		endif
		CurrentHour = 0
		SoulGemStartHour = 0
		ActorRef = none
		FatherRef = none
		lastGameTime = 0.0
		CumInflation = 0.0
		isvictim = false
		fertilised = false
		FatherIsCreature = false
		BreastScaling = true
		BellyScaling = true
		SoulGemCount = 0
		Clear()
		;Debug.Notification("HentaiPregnantActorAlias Normal")
	EndEvent
	
	event OnUpdate()
		; catch any pending updates
	endEvent
EndState

function setIsVictim(bool victim)
	isvictim = victim
endFunction

bool function isVictim()
	return isvictim
endFunction

function setFertilised(bool fertilise)
	fertilised = fertilise
endFunction

bool function isFertilised()
	return fertilised
endFunction

function setFather(Actor male)
	FatherRef = male
endFunction

Actor function getFather()
	return FatherRef
endFunction

function setFatherIsCreature(bool ishe)
	FatherIsCreature = ishe
endFunction

bool function getFatherIsCreature()
	return 	FatherIsCreature
endFunction

Actor function getMother()
	return ActorRef
endFunction

int function getCurrentHour()
	return CurrentHour
endFunction

int function getSoulGemStartHour()
	return SoulGemStartHour
endFunction

int function setSoulGemStartHour()
	if SoulGemCount == 0
		SoulGemStartHour = 0
	elseif SoulGemStartHour == 0
		SoulGemStartHour = CurrentHour
	endif
endFunction

int function getId()
	return pregnancyId
endFunction

int function setId(int newid)
	pregnancyId = newid
endFunction

int function getDurationHours()
	return DurationHours
endFunction

int function getPostDurationHours()
	return PostDurationHours
endFunction

int function getMilk()
	if ActorRef.GetFactionRank(HentaiP.HentaiLactatingFaction) < 0
		setMilk(0)
	endif
	;can have more milk than mod allows(if set manually/by other mod), will be reset on next milk update cycle
	Milk = PapyrusUtil.ClampInt(ActorRef.GetFactionRank(HentaiP.HentaiLactatingFaction), 0, 100)
	return Milk
endFunction

int function setMilk(int i)
	Milk = PapyrusUtil.ClampInt(i, 0, Math.Floor(CurrentBreastSize))
	ActorRef.SetFactionRank(HentaiP.HentaiLactatingFaction, Milk)
	updateSizeBreast()
	return Milk
endFunction

float function getCumInflation()
	return CumInflation
endFunction

float function setCumInflation(float i)
	if (CumInflation + i ) / 1000 <= HentaiP.config.CumBellySizeMax * (1 + Utility.RandomFloat(-1*HentaiP.config.CumBellySizeMaxRandomizer, HentaiP.config.CumBellySizeMaxRandomizer)/100)
		CumInflation = i
	else
		CumInflation = HentaiP.config.CumBellySizeMax * (1 + Utility.RandomFloat(-1*HentaiP.config.CumBellySizeMaxRandomizer, HentaiP.config.CumBellySizeMaxRandomizer)/100) * 1000
		if HentaiP.config.EnableMessages && (ActorRef == HentaiP.PlayerRef || HentaiP.PlayerRef.GetDistance(ActorRef) < 500)
			Debug.Notification(ActorRef.GetDisplayName() + HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(7))
		EndIf
	endIf
	if CumInflation < 0
		CumInflation = 0
	endif
	updateSizeBelly()
	return CumInflation
endFunction

int function getSoulGemCount()
	return SoulGemCount
endFunction

int function setSoulGemCount(int i)
	if i <= HentaiP.config.MaxScaleBelly/HentaiP.config.SoulGemBellySize
		SoulGemCount = i
	else
		if HentaiP.config.EnableMessages && (ActorRef == HentaiP.PlayerRef || HentaiP.PlayerRef.GetDistance(ActorRef) < 500)
			Debug.Notification(ActorRef.GetDisplayName() + HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(6))
		EndIf
		SoulGemCount = Math.Floor(HentaiP.config.MaxScaleBelly/HentaiP.config.SoulGemBellySize)
	endIf
	if SoulGemCount < 0
		SoulGemCount = 0
	endif
	setSoulGemStartHour()
	return SoulGemCount
endFunction

function incrSizeBreast()
	if ( CurrentBreastSize < TargetBreastSize)
		CurrentBreastSize += IncrBreastRate
	endIf
	updateSizeBreast()
endFunction

function decrSizeBreast()
	if CurrentBreastSize > 1
		CurrentBreastSize -= IncrBreastRate
	endIf
	updateSizeBreast()
endFunction

function updateSizeBreast()
	;fix preg breast
	if CurrentBreastSize <= 1
		CurrentBreastSize = 1
	EndIf

	;fix milk breast
	if Milk < 0
		Milk = 0
	endif
	
	if BreastScaling
		float MilkBreastSize = ((TargetBreastSize-CurrentBreastSize) / TargetBreastSize) * Milk
		float FinalBreastSize = CurrentBreastSize + MilkBreastSize
		;fix final Breast
		if FinalBreastSize > HentaiP.config.MaxScaleBreasts
			FinalBreastSize = HentaiP.config.MaxScaleBreasts
		endIf
		HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC L Breast", FinalBreastSize)
		HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC R Breast", FinalBreastSize)
		HentaiP.BodyMod.SetMorphScale(ActorRef, "NipplePerkiness", Milk)
		HentaiP.BodyMod.SetMorphScale(ActorRef, "NippleLength", Milk)
	endIf
endFunction

function incrSizeBelly()
	if ( CurrentBellySize < TargetBellySize)
		if SoulGemCount == 0
			CurrentBellySize += IncrBellyRate
		Else
			if ( CurrentBellySize < HentaiP.config.SoulGemBellySize * SoulGemCount)
				CurrentBellySize += IncrBellyRate
			EndIf
		EndIf
	endIf	
	updateSizeBelly()
endFunction

bool function deflatePregnantBelly()
	While CurrentBellySize > 1
		decrSizeBelly()
		Utility.Wait(0.1)
	EndWhile
	return true
endFunction

function decrSizeBelly()
	;dec preg belly
	if CurrentBellySize > 1
		CurrentBellySize -= 0.1
	endIf
	;dec cum belly(maybe not fully)
	if CumInflation > 0
		CumInflation -= 100
	endif
	updateSizeBelly()
endFunction

function updateSizeBelly()
	;fix preg belly
	if CurrentBellySize <= 1
		CurrentBellySize = 1
	EndIf

	;fix cum belly
	if CumInflation < 0
		CumInflation = 0
	endif
	
	if BellyScaling
		float CumBellySize = HentaiP.config.CumBellySizePerCum * CumInflation / 1000
		;Debug.Notification("CumBellySizePerCum " + HentaiP.config.CumBellySizePerCum)
		;Debug.Notification("CumInflation " + CumInflation)
		if CumBellySize > HentaiP.config.CumBellySizeMax * (1 + Utility.RandomFloat(-1*HentaiP.config.CumBellySizeMaxRandomizer, HentaiP.config.CumBellySizeMaxRandomizer)/100)
			CumBellySize = HentaiP.config.CumBellySizeMax * (1 + Utility.RandomFloat(-1*HentaiP.config.CumBellySizeMaxRandomizer, HentaiP.config.CumBellySizeMaxRandomizer)/100)
		endIf
		
		float FinalBellySize = CurrentBellySize + CumBellySize
		;fix final belly
		if FinalBellySize > HentaiP.config.MaxScaleBelly
			FinalBellySize = HentaiP.config.MaxScaleBelly
		endIf
		HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC Belly", FinalBellySize)
		;Debug.Notification("CumBellySize " + CumBellySize)
		;Debug.Notification("CurrentBellySize " + CurrentBellySize)
		;Debug.Notification("FinalBellySize " + FinalBellySize)
	endIf
endFunction

; called on player load game/changecell to refresh body, usefull when using NIE scaling
function recheckBody()
	updateSizeBelly()
	updateSizeBreast()
endFunction

bool function PregDurationCalc()
	int DurationDays = HentaiP.config.PregnancyDuration
	DurationHours = (DurationDays * 24 * (1 - Utility.RandomFloat(-0.1, 0.1))) as int
	
	return true
endFunction

bool function targetSizeCalc()
	TargetBreastSize = HentaiP.config.MaxScaleBreasts
	TargetBellySize = HentaiP.config.MaxScaleBelly
	
	float BreastSizeDelta = TargetBreastSize - CurrentBreastSize
	float BellySizeDelt = TargetBellySize - CurrentBellySize
	IncrBreastRate = BreastSizeDelta / (DurationHours / 2)
	IncrBellyRate = BellySizeDelt / (DurationHours / 2)
	
	return true
endFunction

function setBreastScaling(bool value = true)
	;Skeleton check	
	if !NetImmerse.HasNode(ActorRef, "NPC L Breast", false)
		Debug.Notification("HP:" + ActorRef.GetLeveledActorBase().GetName() + HentaiP.Strings.ShowHentaiPregnancyStrings(5))
		value = false
	endIf
	if !NetImmerse.HasNode(ActorRef, "NPC R Breast", false)
		Debug.Notification("HP:" + ActorRef.GetLeveledActorBase().GetName() + HentaiP.Strings.ShowHentaiPregnancyStrings(6))
		value = false
	endIf
	if !HentaiP.config.BreastScaling
		value = false
	endIf
	
	BreastScaling = value
endFunction

function setBellyScaling(bool value = true)
	;Skeleton check	
	if !NetImmerse.HasNode(ActorRef, "NPC Belly", false)
		Debug.Notification("HP:" + ActorRef.GetLeveledActorBase().GetName() + HentaiP.Strings.ShowHentaiPregnancyStrings(7))
		value = false
	endIf
	if !HentaiP.config.BellyScaling
		value = false
	endIf
	
	BellyScaling = value
endFunction

State Inseminated
	Event OnBeginState()
		ActorRef = GetActorRef()
		ActorRef.AddToFaction(HentaiP.HentaiPregnantFaction)
		setBreastScaling()
		setBellyScaling()
	
		;old cuminflation
		;int random = Utility.RandomInt(0, 100)
		;int chance = HentaiP.config.CumInflationChance
		;if random <= chance && (!HentaiP.config.CumInflationCreaturesOnly || (HentaiP.config.CumInflationCreaturesOnly && FatherIsCreature))
		if fertilised
			GoToState("Pregnant")
		elseif CumInflation > 0
			GoToState("CumInflated")
		else
			HentaiP.ResetBody(ActorRef)
			GoToState("ReadyForPregnancy")
		endIf
	EndEvent
	
	event OnDeath(Actor akKiller)
		HentaiP.ResetBody(ActorRef)
		GoToState("ReadyForPregnancy")
	EndEvent	
EndState

State CumInflated
	Event OnBeginState()
		if fertilised
			GetActorRef().SetFactionRank(HentaiP.HentaiPregnantFaction, 2)
		else
			GetActorRef().SetFactionRank(HentaiP.HentaiPregnantFaction, 1)
		endif
		TargetBellySize = HentaiP.config.CumBellySizeMax * (1 + Utility.RandomFloat(-1*HentaiP.config.CumBellySizeMaxRandomizer, HentaiP.config.CumBellySizeMaxRandomizer)/100)
		RegisterForSingleUpdateGameTime(1)
	EndEvent
	
	Event OnUpdateGameTime()
		if !fertilised && CumInflation > 0
			;leak out/ absorb cum
			CumInflation -= HentaiP.config.CumAbsorb
			updateSizeBelly()
			RegisterForSingleUpdateGameTime(1)
		else
			RegisterForSingleUpdate(5)
		endif
	EndEvent
		
	Event OnUpdate()
		If (!ActorRef.IsInCombat() && !ActorRef.IsInFaction(HentaiP.SexLab.AnimatingFaction))
			if fertilised
				GoToState("Pregnant")
			else
				HentaiP.ResetBody(ActorRef)
				GoToState("ReadyForPregnancy")
			endIf
		Else
			RegisterForSingleUpdate(5)
		EndIf
	EndEvent

	event OnDeath(Actor akKiller)
		HentaiP.ResetBody(ActorRef)
		GoToState("ReadyForPregnancy")
	EndEvent	
EndState

State Pregnant
	Event OnBeginState()
		ActorRef = GetActorRef()
		GetActorRef().SetFactionRank(HentaiP.HentaiPregnantFaction, 3)
		;Debug.Notification("HentaiPregnantActorAlias Pregnant")
		
		CurrentBellySize = 1
		CurrentBreastSize = 1
		PregDurationCalc()
		targetSizeCalc()
		lastGameTime = Utility.GetCurrentGameTime()

		RegisterForSingleUpdateGameTime(1)
	EndEvent
	
	Event OnUpdateGameTime()
		if CurrentHour < DurationHours
			if(lastGameTime == 0.0)
				lastGameTime  = Utility.GetCurrentGameTime()
			EndIf		
			float currentTime  = Utility.GetCurrentGameTime()	
			float hourspassedfloat = (currentTime - lastGameTime) * 24
			int hourspassed = hourspassedfloat as int
			;Debug.Notification("Hours passed " + hourspassed)	
			if (hourspassed <=0)
				hourspassed = 1
			endif
			CurrentHour += hourspassed
			While hourspassed > 0
				CumInflation -= HentaiP.config.CumAbsorb
				incrSizeBreast()
				incrSizeBelly()
				hourspassed -= 1
			EndWhile
			lastGameTime = currentTime
			
			HentaiP.addTempPregnancyEffects(ActorRef, DurationHours - CurrentHour, isvictim)
			
			RegisterForSingleUpdateGameTime(1)
			
			if ActorRef == HentaiP.PlayerRef
				if !ActorRef.HasSpell(HentaiP.HentaiSoulgemBirthSpell) && SoulGemCount > 0
					ActorRef.Addspell(HentaiP.HentaiSoulgemBirthSpell)
				EndIf
				
				If CurrentHour >= DurationHours/3 && HentaiP.config.PCMilking
					;hand milking
					if !ActorRef.HasSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(0) as Spell)
						if HentaiP.config.EnableMessages
							Debug.Notification(HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(0))
						EndIf
						ActorRef.Addspell(HentaiP.HentaiMilkSquirtSpellList.GetAt(0) as Spell)
					EndIf
					;bottle milking; req HF
					if !ActorRef.HasSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(1) as Spell) && Game.GetModbyName("HearthFires.esm") != 255
						ActorRef.Addspell(HentaiP.HentaiMilkSquirtSpellList.GetAt(1) as Spell)
					EndIf
				EndIf
			EndIf
			
			if (ActorRef == HentaiP.PlayerRef && HentaiP.config.PCMilking) || (ActorRef != HentaiP.PlayerRef && HentaiP.config.NPCMilking)
				If CurrentHour > DurationHours/3
					setMilk(getMilk() + 1)
					If ActorRef == HentaiP.PlayerRef
						if HentaiP.config.EnableMessages
							Debug.Notification(HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(1))
						EndIf
					Elseif HentaiP.config.NPCMilking
						HentaiP.NpcMilking(ActorRef)
					EndIf
				Else
					ActorRef.RemoveFromFaction(HentaiP.HentaiLactatingFaction)
				EndIf
			EndIf
			
		Else
			UnregisterForUpdate()
			GoToState("PregnancyEnded")
		EndIf
	EndEvent

	event OnEndState()
		if ActorRef.HasSpell(HentaiP.HentaiSoulgemBirthSpell)
			ActorRef.RemoveSpell(HentaiP.HentaiSoulgemBirthSpell)
		EndIf
	endEvent	
	
	event OnDeath(Actor akKiller)
		HentaiP.ResetBody(ActorRef)
		GoToState("ReadyForPregnancy")
	EndEvent	
EndState

State SoulGemBirth
	Event OnBeginState()
		;Debug.Notification("HentaiPregnantActorAlias PregnancyEnded")
		GoToState("PregnancyEnded")
	EndEvent
EndState

;birth
State PregnancyEnded
	Event OnBeginState()
;		Debug.Notification("HentaiPregnantActorAlias PregnancyEnded")
		RegisterForSingleUpdate(5)
;		Debug.Notification("PregnancyEnded OnBeginState")
	EndEvent
	
	Event OnUpdate()
;		Debug.Notification("PregnancyEnded OnUpdate")
		If (!ActorRef.IsInCombat() && !ActorRef.IsInFaction(HentaiP.SexLab.AnimatingFaction))
			while ( ActorRef.IsOnMount() )
				ActorRef.Dismount()
				Utility.Wait( 2.0 )
			endWhile
			
;			Debug.Notification("PregnancyEnded rdy for birth")
			if SoulGemCount == 0
;				Debug.Notification("PregnancyEnded normal birth")
				HentaiP.endPregnancy(ActorRef, pregnancyId, isvictim, CurrentHour)
				GoToState("PostPregnancy")
			else
;				Debug.Notification("PregnancyEnded SoulGem birth")
				if ActorRef.HasSpell(HentaiP.HentaiSoulgemBirthSpell)
					ActorRef.RemoveSpell(HentaiP.HentaiSoulgemBirthSpell)
				EndIf
				HentaiP.endPregnancy(ActorRef, -1, isvictim, CurrentHour)
				HentaiP.SoulGemBirth(pregnancyID)
				GoToState("PostPregnancy")
			endif
		Else
;			Debug.Notification("PregnancyEnded actor in combat or animating, retry in 5 sec")
			RegisterForSingleUpdate(5)
		EndIf
	EndEvent
	
	event OnEndState()
		deflatePregnantBelly()
		if HentaiP.config.EnableMessages
			Debug.Notification(ActorRef.GetDisplayName() + HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(2))
		EndIf
	endEvent	
EndState

State PostPregnancy
	Event OnBeginState()
		int DurationDays = HentaiP.config.PregnancyDuration
		float BreastSizeDelta = CurrentBreastSize - 1
		PostDurationHours = (CurrentHour * 0.2 * (1 - Utility.RandomFloat(-0.1, 0.1))) as int
		PostDurationHours += CurrentHour
		IncrBreastRate = BreastSizeDelta / PostDurationHours
		
		lastGameTime = Utility.GetCurrentGameTime()
		
		RegisterForSingleUpdateGameTime(1)
	EndEvent
	
	Event OnUpdateGameTime()
		if CurrentHour < PostDurationHours
			if(lastGameTime == 0.0)
				lastGameTime  = Utility.GetCurrentGameTime()
			EndIf		
			float currentTime  = Utility.GetCurrentGameTime()	
			float hourspassedfloat = (currentTime - lastGameTime) * 24
			int hourspassed = hourspassedfloat as int
			;Debug.Notification("Hours passed " + hourspassed)	
			if(hourspassed<=0)
				hourspassed = 1
			endif
			CurrentHour += hourspassed
			While hourspassed > 0
				CumInflation -= HentaiP.config.CumAbsorb
				decrSizeBreast()
				updateSizeBelly()
				hourspassed -= 1
			EndWhile
			lastGameTime = currentTime
			
			if (ActorRef == HentaiP.PlayerRef && HentaiP.config.PCMilking) || (ActorRef != HentaiP.PlayerRef && HentaiP.config.NPCMilking)
				If CurrentHour+PostDurationHours/3 < PostDurationHours
					setMilk(getMilk() + 1)
					If ActorRef == HentaiP.PlayerRef
						if HentaiP.config.EnableMessages
							Debug.Notification(HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(1))
						EndIf
					Elseif HentaiP.config.NPCMilking
						HentaiP.NpcMilking(ActorRef)
					EndIf
				Else
					ActorRef.RemoveFromFaction(HentaiP.HentaiLactatingFaction)
				EndIf
			EndIf
			;old milking, disabled
			;HentaiP.addTempPostPregnancyEffects(ActorRef, PostDurationHours - CurrentHour)
			
			RegisterForSingleUpdateGameTime(1)
		ElseIf CumInflation > 0
			fertilised = false
			GoToState("CumInflated")
		Else
			UnregisterForUpdate()
			HentaiP.ResetBody(ActorRef)
			GoToState("ReadyForPregnancy")
		EndIf
	EndEvent		
	
	event OnEndState()
		if HentaiP.config.EnableMessages
			Debug.Notification(ActorRef.GetDisplayName() + HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(3))
		endif
	endEvent	
EndState

State ClearPregnancy
	Event OnBeginState()
		UnregisterForUpdate()
			
		if ActorRef == HentaiP.PlayerRef
			if ActorRef.HasSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(0) as Spell)
				if HentaiP.config.EnableMessages
					Debug.Notification(HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(4))
				EndIf
				ActorRef.RemoveSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(0) as Spell)
			EndIf
			if ActorRef.HasSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(1) as Spell)
				ActorRef.RemoveSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(1) as Spell)
			EndIf
			if ActorRef.HasSpell(HentaiP.HentaiSoulgemBirthSpell)
				ActorRef.RemoveSpell(HentaiP.HentaiSoulgemBirthSpell)
			EndIf
		endif

		HentaiP.ResetBody(ActorRef)
		GoToState("ReadyForPregnancy")
	EndEvent
	
	event OnEndState()
		if HentaiP.config.EnableMessages
			Debug.Notification(ActorRef.GetDisplayName() + HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(5))
			;Debug.notification(HentaiP.config.translateString("$HP_HentaiPregnantActorAliasNotifications6{" + ActorRef.GetDisplayName() + "}"))
			;HentaiP.config.translateString("$HP_HentaiPregnantActorAliasNotifications6{" + ActorRef.GetDisplayName() + "}")
		endif
	endEvent
	
	event OnUpdate()
		; catch any pending updates
	endEvent	
EndState

event OnSit(ObjectReference akFurniture)
	;machine milking
	
	Bool MMEZAZ1 = Game.GetFormFromFile(0x26D2E, "MilkModNew Zaz.esp")
	Bool MMEZAZ2 = Game.GetFormFromFile(0x26D2E , "MilkModNew Zaz Sandbox.esp")
	Bool MME1 = akFurniture.HasKeyword( Game.GetFormFromFile(0x7e3bc, "MilkModNew.esp") as Keyword )
	Bool MME2 = akFurniture.HasKeyword( Game.GetFormFromFile(0x7e3bd, "MilkModNew.esp") as Keyword )
	Bool ZAZ1 = akFurniture.HasKeyword( Game.GetFormFromFile(0x26D1B, "ZaZAnimationPack.esm") as Keyword )
	Bool ZAZ2 = akFurniture.HasKeyword( Game.GetFormFromFile(0x26D17, "ZaZAnimationPack.esm") as Keyword )

	Int Animationtoplay = 0
	
	;Debug.Notification(" OnSit ")
	if MME1	|| ZAZ1
		;Non bound milking
		if !MMEZAZ1 && !MMEZAZ2 && ZAZ1
			;run animation if there are no mme patches for zaz and its zaz dwemer machines
			Animationtoplay = 1
		endif
	elseif MME2	|| ZAZ2
		;Bound milking
		if !MMEZAZ1 && !MMEZAZ2 && ZAZ2
			;run animation if there are no mme patches for zaz and its zaz dwemer machines
			Animationtoplay = 2
		endif
	else
		; wrong furniture, exit
		;Debug.Notification(" wrong furniture ")
		return
	endif
	
	;strip
	form stripped
	if HentaiP.config.MilkpumpsStrip
		stripped = HentaiP.getBodyItem(ActorRef)
		HentaiP.UnequipItem(ActorRef, stripped, true, false)
		;Debug.Notification("stripped " +  stripped.getname())
	endif
	
	;wait for sit
	utility.wait(5.0)
;	while ActorRef.GetSitState() != 3
;		utility.wait(1.0)
;		;Debug.Notification(" wait for sit ")
;		if ActorRef.GetSitState() == 0
;			return
;		endif
;	endwhile
	
	;play animation
	if HentaiP.config.MilkpumpsPlayAnimation
		;Debug.Notification(" play anim " + Animationtoplay)
		if Animationtoplay == 1
			Debug.SendAnimationEvent(ActorRef,"ZaZMOMFreeFurn_11")
			;Debug.Notification(" ZaZMOMFreeFurn_11 ")
		elseif Animationtoplay == 2
			Debug.SendAnimationEvent(ActorRef,"ZaZMOMBoundFurn_11")
			;Debug.Notification(" ZaZMOMBoundFurn_11 ")
		endif
	endif
	
	;milk/inflate
	while ActorRef.GetSitState() > 0
		utility.wait(5.0)
		;reduce milk
		if getMilk() > 0
			setMilk(getMilk() - 1)
			if Game.GetModbyName("HearthFires.esm") != 255
				ActorRef.AddItem(Game.GetFormFromFile(0x3534, "HearthFires.esm"), 1)
			endif
			if HentaiP.PlayerRef.GetDistance(ActorRef) < 500 && HentaiP.config.EnableMessages
				Debug.Notification(ActorRef.GetDisplayName() + " - " + getMilk() + HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(8))
			endif
		endif
		
		;reduce/increase cuminflation
		if HentaiP.config.MilkpumpsCuminflationMode == 1
			setCumInflation(getCumInflation() + HentaiP.config.CumDrain*5)
		elseif HentaiP.config.MilkpumpsCuminflationMode == 2
			setCumInflation(getCumInflation() - HentaiP.config.CumDrain*5)
		endif
	endwhile
	
	;redress
	if stripped
		HentaiP.EquipItem(ActorRef, stripped, false, false)
	endif
	
	;Debug.Notification("stop milking")
endevent
