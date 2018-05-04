Scriptname HentaiPregnantActorAlias extends ReferenceAlias  

HentaiPregnancy Property HentaiP Auto

Actor Property ActorRef Auto
Actor Property FatherRef Auto

Float CurrentBreastSize = 1.0
Float CurrentBellySize = 1.0

Float IncrBreastRate = 0.0
Float IncrBellyRate = 0.0

Int pregnancyId = -1
Int DurationHours = 0
Int PostDurationHours = 0
Int CurrentHour = 0
Int Milk = 0
Int SoulGemCount = 0

float TargetBreastSize = 0.0
float TargetBellySize = 0.0

float lastGameTime = 0.0

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
		ActorRef = none
		FatherRef = none
		lastGameTime = 0.0
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

function setBreastScaling(bool value)
	BreastScaling = value
endFunction

function setBellyScaling(bool value)
	BellyScaling = value
endFunction
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
	return Milk
endFunction

int function setMilk(int i)
	Milk = i
	ActorRef.AddToFaction(HentaiP.HentaiLactatingFaction)
	ActorRef.SetFactionRank(HentaiP.HentaiLactatingFaction, Milk)
	return Milk
endFunction

int function getSoulGemCount()
	return SoulGemCount
endFunction

int function setSoulGemCount(int i)
	if SoulGemCount + i <= HentaiP.config.SoulGemsMax
		SoulGemCount = i
	endIf
	return SoulGemCount
endFunction

function incrSize()
	if ( CurrentBreastSize < TargetBreastSize) && BreastScaling
		CurrentBreastSize += IncrBreastRate
		if HentaiP.config.BreastScaling 
			HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC L Breast", CurrentBreastSize)
			HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC R Breast", CurrentBreastSize)
		EndIf
	endIf
	if ( CurrentBellySize < TargetBellySize) && BellyScaling
		if !HentaiP.config.SoulGemPregnancy
			CurrentBellySize += IncrBellyRate
			if HentaiP.config.BellyScaling
				HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC Belly", CurrentBellySize)
			EndIf
		Else
			if ( CurrentBellySize < HentaiP.config.SoulGemBellySize * SoulGemCount)
				CurrentBellySize += IncrBellyRate
				if HentaiP.config.BellyScaling
					HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC Belly", CurrentBellySize)
				EndIf
			EndIf
		EndIf
	endIf	
endFunction

function decrSizeBreast()
	if BreastScaling
		if ( CurrentBreastSize > 1)
			CurrentBreastSize -= IncrBreastRate
			if HentaiP.config.BreastScaling 
				HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC L Breast", CurrentBreastSize)
				HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC R Breast", CurrentBreastSize)
			EndIf
		endIf
		if CurrentBreastSize <= 1
			CurrentBreastSize = 1
			if HentaiP.config.BreastScaling 
				HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC L Breast", 1)
				HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC R Breast", 1)
			EndIf
		EndIf
	EndIf
endFunction

function decrSizeBelly()
	if BellyScaling
		if ( CurrentBellySize > 1)
			CurrentBellySize -= IncrBellyRate
			if HentaiP.config.BellyScaling 
				HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC Belly", CurrentBellySize)
			EndIf
		endIf
		if CurrentBellySize <= 1
			CurrentBellySize = 1
			if HentaiP.config.BellyScaling 
				HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC Belly", 1)
			EndIf
		EndIf
	EndIf
endFunction

; called on player load game/changecell to refresh body, usefull when using NIE scaling
function recheckBody()
	if HentaiP.config.BellyScaling 
		HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC Belly", CurrentBellySize)
	EndIf
	if HentaiP.config.BreastScaling 
		HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC L Breast", CurrentBreastSize)
		HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC R Breast", CurrentBreastSize)
	EndIf
endFunction

State Inseminated
	Event OnBeginState()
		ActorRef = GetActorRef()
		ActorRef.AddToFaction(HentaiP.HentaiPregnantFaction)
	
		int random = Utility.RandomInt(0, 100)
		int chance = HentaiP.config.CumInflationChance
		if random <= chance && (!HentaiP.config.CumInflationCreaturesOnly || (HentaiP.config.CumInflationCreaturesOnly && FatherIsCreature))
			GoToState("CumInflated")
		elseif fertilised
			GoToState("Pregnant")
		else
			GoToState("ReadyForPregnancy")
		endIf
	EndEvent
	
	event OnDeath(Actor akKiller)
		GoToState("PregnancyEnded")
	EndEvent	
EndState

State CumInflated
	Event OnBeginState()
		if fertilised
			GetActorRef().SetFactionRank(HentaiP.HentaiPregnantFaction, 2)
		else
			GetActorRef().SetFactionRank(HentaiP.HentaiPregnantFaction, 1)
		endif

		CurrentBellySize = 1
		TargetBellySize = HentaiP.config.MaxScaleBelly * 0.25
		
		While CurrentBellySize < TargetBellySize && BellyScaling
			if CurrentBellySize < TargetBellySize
				CurrentBellySize += 0.1
				if HentaiP.config.BellyScaling
					HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC Belly", CurrentBellySize)
				endif
			EndIf
			Utility.Wait(0.1)
		EndWhile
		RegisterForSingleUpdateGameTime(1)
	EndEvent
	
	Event OnUpdateGameTime()
		UnregisterForUpdate()
		if fertilised
			GoToState("Pregnant")
		else
			HentaiP.endPregnancy(ActorRef, -1, isvictim, 1)
			GoToState("ReadyForPregnancy")
		endIf
	EndEvent
		
	event OnEndState()
		While CurrentBellySize > 1 && BellyScaling
			if CurrentBellySize > 1
				CurrentBellySize -= 0.1
				if HentaiP.config.BellyScaling 
					HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC Belly", CurrentBellySize)
				EndIf
			EndIf
			Utility.Wait(0.1)
		EndWhile
		HentaiP.ResetBody(ActorRef)
	endEvent
	
	event OnDeath(Actor akKiller)
		GoToState("PregnancyEnded")
	EndEvent	
EndState

State Pregnant
	Event OnBeginState()
		ActorRef = GetActorRef()
		GetActorRef().SetFactionRank(HentaiP.HentaiPregnantFaction, 3)
		;Debug.Notification("HentaiPregnantActorAlias Pregnant")
		int DurationDays = HentaiP.config.PregnancyDuration
		
		CurrentBellySize = 1
		CurrentBreastSize = 1
		TargetBreastSize = HentaiP.config.MaxScaleBreasts
		TargetBellySize = HentaiP.config.MaxScaleBelly	
		
		float BreastSizeDelta = TargetBreastSize - CurrentBreastSize
		float BellySizeDelt = TargetBellySize - CurrentBellySize
		DurationHours = (DurationDays * 24 * (1 - Utility.RandomFloat(-0.1, 0.1))) as int
		IncrBreastRate = BreastSizeDelta / (DurationHours / 2)
		IncrBellyRate = BellySizeDelt / (DurationHours / 2)
		
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
			if(hourspassed<=0)
				hourspassed = 1
			endif
			CurrentHour += hourspassed
			While hourspassed > 0
				incrSize()
				hourspassed -= 1
			EndWhile
			lastGameTime = currentTime
			
			HentaiP.addTempPregnancyEffects(ActorRef, DurationHours - CurrentHour, isvictim)
			
			RegisterForSingleUpdateGameTime(1)
			
			if ActorRef == HentaiP.PlayerRef
				if !ActorRef.HasSpell(HentaiP.HentaiSoulgemBirthSpell) && SoulGemCount > 0
					ActorRef.Addspell(HentaiP.HentaiSoulgemBirthSpell)
				EndIf
				
				If CurrentHour >= DurationHours/3 && HentaiP.config.Milking
					;hand milking
					if !ActorRef.HasSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(0) as Spell)
						Debug.Notification(HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(0))
						ActorRef.Addspell(HentaiP.HentaiMilkSquirtSpellList.GetAt(0) as Spell)
					EndIf
					;bottle milking; req HF
					if !ActorRef.HasSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(1) as Spell) && Game.GetModbyName("HearthFires.esm") != 255
						ActorRef.Addspell(HentaiP.HentaiMilkSquirtSpellList.GetAt(1) as Spell)
					EndIf
				EndIf
			EndIf
			
			If CurrentHour > DurationHours/3 && HentaiP.config.Milking
				setMilk(Milk + 1)
				If ActorRef == HentaiP.PlayerRef
					Debug.Notification(HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(1))
				Elseif HentaiP.config.NPCMilking
					(HentaiP.HentaiMilkSquirtSpellList.GetAt(1) as Spell).Cast(ActorRef, ActorRef)
				EndIf
			Else
				ActorRef.RemoveFromFaction(HentaiP.HentaiLactatingFaction)
			EndIf
			
		Else
			UnregisterForUpdate()
			GoToState("PregnancyEnded")
		EndIf
	EndEvent		
	
	event OnDeath(Actor akKiller)
		GoToState("PregnancyEnded")
	EndEvent	
EndState

State SoulGemBirth
	Event OnBeginState()
		;Debug.Notification("HentaiPregnantActorAlias PregnancyEnded")
		
		while ( ActorRef.IsOnMount() )
			ActorRef.Dismount()
			Utility.Wait( 2.0 )
		endWhile		
	
		HentaiP.endPregnancy(ActorRef, -1, isvictim, CurrentHour)
		HentaiP.SoulGemBirth(pregnancyID, durationHours)
		GoToState("PostPregnancy")
	EndEvent
EndState

State PregnancyEnded
	Event OnBeginState()
		;Debug.Notification("HentaiPregnantActorAlias PregnancyEnded")
		
		while ( ActorRef.IsOnMount() )
			ActorRef.Dismount()
			Utility.Wait( 2.0 )
		endWhile
		
		if SoulGemCount == 0
			HentaiP.endPregnancy(ActorRef, pregnancyId, isvictim, CurrentHour)
			GoToState("PostPregnancy")
		else
			if ActorRef.HasSpell(HentaiP.HentaiSoulgemBirthSpell)
				ActorRef.RemoveSpell(HentaiP.HentaiSoulgemBirthSpell)
			EndIf
			GoToState("SoulGemBirth")
		endif
	EndEvent
	
	event OnEndState()
		Debug.Notification(ActorRef.GetDisplayName() + HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(2))
	endEvent	
EndState

State PostPregnancy
	Event OnBeginState()
		int DurationDays = HentaiP.config.PregnancyDuration
		float BreastSizeDelta = CurrentBreastSize - 1
		float BellySizeDelt = CurrentBellySize - 1
		PostDurationHours = (CurrentHour * 0.2 * (1 - Utility.RandomFloat(-0.1, 0.1))) as int
		PostDurationHours += CurrentHour
		IncrBreastRate = BreastSizeDelta / PostDurationHours
		IncrBellyRate = BellySizeDelt / PostDurationHours
		
		lastGameTime = Utility.GetCurrentGameTime()
		While CurrentBellySize > 1
			decrSizeBelly()
			Utility.Wait(0.1)
		EndWhile
		
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
			While CurrentBreastSize > 1 && hourspassed > 0
				decrSizeBreast()
				hourspassed -= 1
			EndWhile
			lastGameTime = currentTime
			
			If CurrentHour+PostDurationHours/3 < PostDurationHours && HentaiP.config.Milking
				setMilk(Milk + 1)
				If ActorRef == HentaiP.PlayerRef
					Debug.Notification(HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(1))
				Elseif HentaiP.config.NPCMilking
					(HentaiP.HentaiMilkSquirtSpellList.GetAt(1) as Spell).Cast(ActorRef, ActorRef)
				EndIf
			Else
				ActorRef.RemoveFromFaction(HentaiP.HentaiLactatingFaction)
			EndIf
			;HentaiP.addTempPostPregnancyEffects(ActorRef, PostDurationHours - CurrentHour)
			
			RegisterForSingleUpdateGameTime(1)
		Else
			UnregisterForUpdate()
			GoToState("ReadyForPregnancy")
		EndIf
	EndEvent		
	
	event OnEndState()
		HentaiP.ResetBody(ActorRef)
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
				Debug.Notification(HentaiP.Strings.ShowHentaiPregnantActorAliasStrings(4))
				ActorRef.RemoveSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(0) as Spell)
			EndIf
			if ActorRef.HasSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(1) as Spell)
				ActorRef.RemoveSpell(HentaiP.HentaiMilkSquirtSpellList.GetAt(1) as Spell)
			EndIf
		endif

		GoToState("ReadyForPregnancy")
	EndEvent
	
	event OnEndState()
		HentaiP.ResetBody(ActorRef)
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
