ScriptName HentaiPregnancyConfig extends SKI_ConfigBase

HentaiPregnancy Property hentaiPregnancyQuest auto

; ----- Pregnancy settings -----
int Property CumInflationChance = 50 Auto Hidden
int CumInflationChanceDefault = 50
int OIDCumInflationChance

int OIDCumInflationCreaturesOnly
bool Property CumInflationCreaturesOnly = true Auto Hidden

int Property PregnancyChance = 15 Auto Hidden
int PregnancyChanceDefault = 15
int OIDPregnancyChance

int Property ChildChance = 100 Auto Hidden
int ChildChanceDefault = 100
int OIDChildChance

int Property PregnancyDuration = 7 Auto Hidden
int PregnancyDurationDefault = 7
int OIDPregnancyDuration

string[] PregnancyActorOptions
int OIDPregnancyActorOptions
int Property PregnancyActorOption = 0 Auto Hidden

string[] BirthTypeOptions
int OIDBirthTypeOptions
int Property BirthTypeOption = 0 Auto Hidden

int OIDClearPregnancies
bool ClearPregnancy = false
int[] OIDClearSinglePregnancy

int OIDPregnancyEffects
bool Property PregnancyEffects = true Auto Hidden

int OIDMilking
bool Property Milking = true Auto Hidden

int OIDNPCMilking
bool Property NPCMilking = true Auto Hidden

int OIDMilkAll
bool Property MilkAll = false Auto Hidden

int OIDPostPregnancyEffects
bool Property PostPregnancyEffects = false Auto Hidden

int OIDAllowAnal
bool Property AllowAnal = false Auto Hidden

int OIDAllowNonUnique
bool Property AllowNonUnique = true Auto Hidden

int OIDBreastScaling
bool Property BreastScaling = true Auto Hidden

int OIDResetScaling
bool Property ResetScaling = false Auto Hidden

int OIDBellyScaling
bool Property BellyScaling = true Auto Hidden

string[] BodyTypeOptions
int OIDBodyTypeOptions
int Property BodyTypeOption = 0 Auto Hidden

int OIDEnableMessages
bool Property EnableMessages = true Auto Hidden

; ----- Size settings -----
Float Property MaxScaleBelly = 5.0 Auto Hidden
Float MaxScaleBellyDefault = 5.0
int OIDMaxScaleBelly

Float Property MaxScaleBreasts = 2.0 Auto Hidden
Float MaxScaleBreastsDefault = 2.0
int OIDMaxScaleBreasts

; ----- Soul Gem settings -----

int Property SoulGemDuration = 20 Auto Hidden
int SoulGemDurationDefault = 20
int OIDSoulGemDuration

int Property SoulGemsMax = 9 Auto Hidden
int SoulGemsMaxDefault = 9
int OIDSoulGemsMax

Float Property SoulGemBellySize = 1.0 Auto Hidden
Float SoulGemBellySizeDefault = 1.0
int OIDSoulGemBellySize

int OIDSoulGemPregnancy
bool Property SoulGemPregnancy = false Auto Hidden

int OIDForcedOnly
bool Property ForcedOnly = false Auto Hidden

int OIDCreaturesOnly
bool Property CreaturesOnly = true Auto Hidden

Event OnConfigInit()
	self.RefreshStrings()
EndEvent

int function GetVersion()
	return 20180609
endFunction

event OnVersionUpdate(int a_version)
	if (a_version > 1)
		Debug.Trace(self + ": Updating script to version " + a_version)
		;if (a_version >= 1050 && CurrentVersion < 1050)
		
		;endIf
	endIf
endEvent

Function RefreshStrings()
	Pages = new string[7]
	Pages[0] = "$HP_MCM_Pages1"
	Pages[1] = "$HP_MCM_Pages2"
	Pages[2] = "$HP_MCM_Pages3"
	Pages[3] = "$HP_MCM_Pages4"
	Pages[4] = "$HP_MCM_Pages5"
	Pages[5] = "$HP_MCM_Pages6"
	Pages[6] = "$HP_MCM_Pages7"
	
	PregnancyActorOptions = new string[3]
	PregnancyActorOptions[0] = "$HP_MCM_PregnancyActorOptions1"
	PregnancyActorOptions[1] = "$HP_MCM_PregnancyActorOptions2"
	PregnancyActorOptions[2] = "$HP_MCM_PregnancyActorOptions3"
	
	BirthTypeOptions = new string[2]
	BirthTypeOptions[0] = "$HP_MCM_BirthTypeOptions1"
	BirthTypeOptions[1] = "$HP_MCM_BirthTypeOptions2"
	
	BodyTypeOptions = new string[3]
	BodyTypeOptions[0] = "---"
	BodyTypeOptions[1] = "CBBE"
	BodyTypeOptions[2] = "UNPB"		
EndFunction

Event OnPageReset(string page)
	{Called when a new page is selected, including the initial empty page}
	
	if page == ""
		self.RefreshStrings()
		
	ElseIf page == "$HP_MCM_Pages1"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			OIDEnableMessages = AddToggleOption("$HP_MCM_EnableMessages", EnableMessages)

		SetCursorPosition(1)
			AddHeaderOption("$HP_MCM_BodyScalingHeader")

				OIDBellyScaling = AddToggleOption("$HP_MCM_BellyScaling", BellyScaling)
				OIDMaxScaleBelly = AddSliderOption("$HP_MCM_MaxScaleBelly", MaxScaleBelly, "{1}")

				OIDBreastScaling = AddToggleOption("$HP_MCM_BreastScaling", BreastScaling)
				OIDMaxScaleBreasts = AddSliderOption("$HP_MCM_MaxScaleBreasts", MaxScaleBreasts, "{1}")

				AddEmptyOption()
				OIDResetScaling = AddToggleOption("$HP_MCM_ResetScaling", ResetScaling)

	ElseIf page == "$HP_MCM_Pages2"
		

	ElseIf page == "$HP_MCM_Pages3"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			AddHeaderOption("$HP_MCM_PregnancySettingsHeader")
		
				OIDPregnancyActorOptions = AddMenuOption("$HP_MCM_PregnancyActorOptions", PregnancyActorOptions[PregnancyActorOption])
				OIDAllowAnal = AddToggleOption("$HP_MCM_PregnancyAllowAnal", AllowAnal)
				OIDAllowNonUnique = AddToggleOption("$HP_MCM_PregnancyAllowNonUnique", AllowNonUnique)
				OIDPregnancyChance = AddSliderOption("$HP_MCM_PregnancyChance", PregnancyChance, "{0}%")
				OIDChildChance = AddSliderOption("$HP_MCM_PregnancyChildChance", ChildChance, "{0}%")
;				OIDBirthTypeOptions = AddMenuOption("$HP_MCM_PregnancyBirthTypeOptions", BirthTypeOptions[BirthTypeOption])
				OIDPregnancyDuration = AddSliderOption("$HP_MCM_PregnancyDuration", PregnancyDuration, "$HP_Days")
				AddEmptyOption()

				OIDPregnancyEffects = AddToggleOption("$HP_MCM_PregnancyEffects", PregnancyEffects)
;				OIDPostPregnancyEffects = AddToggleOption("$HP_MCM_PregnancyPostPregnancyEffects", PostPregnancyEffects)
				AddEmptyOption()
	
	ElseIf page == "$HP_MCM_Pages4"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			OIDCumInflationChance = AddSliderOption("$HP_MCM_CumInflationChance", CumInflationChance, "{0}%")
			OIDCumInflationCreaturesOnly = AddToggleOption("$HP_MCM_CumInflationCreaturesOnly", CumInflationCreaturesOnly)
		
	ElseIf page == "$HP_MCM_Pages5"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			OIDMilking = AddToggleOption("$HP_MCM_Milking", Milking)
			OIDNPCMilking = AddToggleOption("$HP_MCM_NPCMilking", NPCMilking)
			OIDMilkAll = AddToggleOption("$HP_MCM_MilkAll", MilkAll)
			OIDBodyTypeOptions = AddMenuOption("$HP_MCM_MilkingBodyTypeOptions", BodyTypeOptions[BodyTypeOption])
		
	ElseIf page == "$HP_MCM_Pages6"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			AddHeaderOption("$HP_MCM_SoulGemHeader")

			OIDSoulGemPregnancy = AddToggleOption("$HP_MCM_SoulGemPregnancy", SoulGemPregnancy)
			OIDCreaturesOnly = AddToggleOption("$HP_MCM_SoulGemCreaturesOnly", CreaturesOnly)
			;OIDForcedOnly = AddToggleOption("$HP_MCM_SoulGemForcedOnly", ForcedOnly)
			OIDSoulGemDuration = AddSliderOption("$HP_MCM_SoulGemDuration", SoulGemDuration, "$HP_Hours")
			OIDSoulGemsMax = AddSliderOption("$HP_MCM_SoulGemsMax", SoulGemsMax, "{0}")
			OIDSoulGemBellySize = AddSliderOption("$HP_MCM_SoulGemBellySize", SoulGemBellySize, "{1}")
		
	ElseIf page == "$HP_MCM_Pages7"
	
		SetCursorFillMode(LEFT_TO_RIGHT)
		
		SetCursorPosition(0)
		
		AddTextOption("$HP_MCM_Pregnancies", "", OPTION_FLAG_DISABLED)
		OIDClearPregnancies = AddToggleOption("$HP_MCM_ClearPregnancies", ClearPregnancy)
		AddHeaderOption("")
		AddHeaderOption("")

		string[] plist = getPregnancyList()
		int i = 0
		while i < plist.Length
			if hentaiPregnancyQuest.PregnantActors[i].GetActorRef() != none
				;check if actor is cuminflating,pregnant,postpregnant
				if !hentaiPregnancyQuest.isNotPregnant(hentaiPregnancyQuest.PregnantActors[i].GetActorRef())
					AddTextOption(plist[i], "", OPTION_FLAG_DISABLED)
					if (StringUtil.GetLength(plist[i]) > 0)
						OIDClearSinglePregnancy[i] = AddTextOption("", "$HP_MCM_ClearPregnancy")
;						AddTextOption("Soulgems: " + hentaiPregnancyQuest.PregnantActors[i].getSoulGemCount(), "Size: " + hentaiPregnancyQuest.PregnantActors[i].getDurationHours() / SoulGemDuration / hentaiPregnancyQuest.PregnantActors[i].getSoulGemCount(), OPTION_FLAG_DISABLED)
						
						form SoulGemType = hentaiPregnancyQuest.getSoulGemSize(hentaiPregnancyQuest.PregnantActors[i].getId())
						if SoulGemType != none
							AddTextOption(SoulGemType.GetName(), hentaiPregnancyQuest.PregnantActors[i].getSoulGemCount(), OPTION_FLAG_DISABLED)
						else
							AddTextOption("None", hentaiPregnancyQuest.PregnantActors[i].getSoulGemCount(), OPTION_FLAG_DISABLED)
						endIf
						
						if hentaiPregnancyQuest.PregnantActors[i].getMilk() > 0
							AddTextOption("$HP_MCM_Milk", hentaiPregnancyQuest.PregnantActors[i].getMilk(), OPTION_FLAG_DISABLED)
						else
							AddTextOption("", "", OPTION_FLAG_DISABLED)
						endIf
					else
						AddTextOption("you shouldnt see this", "", OPTION_FLAG_DISABLED)
					endIf
				endIf
			endIf
			i += 1
		endWhile
		
	EndIf
	
EndEvent

Event OnOptionSliderAccept(int option, float floatValue)
	
	int value = floatValue as int
	
	If option == OIDPregnancyChance
		
		SetSliderOptionValue(option, floatValue, "{0}%")
		PregnancyChance = value

	ElseIf option == OIDChildChance
		
		SetSliderOptionValue(option, floatValue, "{0}%")
		ChildChance = value
		
	ElseIf option == OIDCumInflationChance
		
		SetSliderOptionValue(option, floatValue, "{0}%")
		CumInflationChance = value
		
	ElseIf option == OIDMaxScaleBelly
		
		SetSliderOptionValue(option, floatValue,"{1}")
		MaxScaleBelly = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDMaxScaleBreasts
		
		SetSliderOptionValue(option, floatValue, "{1}")
		MaxScaleBreasts = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDPregnancyDuration
		
		SetSliderOptionValue(option, floatValue, "$HP_Days")
		PregnancyDuration = value
		hentaiPregnancyQuest.UpdatePregDuration()
		
	ElseIf option == OIDSoulGemDuration
		
		SetSliderOptionValue(option, floatValue, "$HP_Hours")
		SoulGemDuration = floatValue as int
		
	ElseIf option == OIDSoulGemsMax
		
		SetSliderOptionValue(option, floatValue, "{0}")
		SoulGemsMax = floatValue as int
		
	ElseIf option == OIDSoulGemBellySize
		
		SetSliderOptionValue(option, floatValue, "{1}")
		SoulGemBellySize = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	EndIf
	
EndEvent

Event OnOptionSliderOpen(int option)
	
	If option == OIDPregnancyChance
		
		SetSliderDialogStartValue(PregnancyChance)
		SetSliderDialogDefaultValue(PregnancyChanceDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	
	ElseIf option == OIDChildChance
		
		SetSliderDialogStartValue(ChildChance)
		SetSliderDialogDefaultValue(ChildChanceDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
		
	ElseIf option == OIDCumInflationChance
		
		SetSliderDialogStartValue(CumInflationChance)
		SetSliderDialogDefaultValue(CumInflationChanceDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)	
		
	ElseIf option == OIDMaxScaleBelly
		
		SetSliderDialogStartValue(MaxScaleBelly)
		SetSliderDialogDefaultValue(MaxScaleBellyDefault)
		SetSliderDialogRange(0.5, 20)
		SetSliderDialogInterval(0.5)
		
	ElseIf option == OIDMaxScaleBreasts
		
		SetSliderDialogStartValue(MaxScaleBreasts)
		SetSliderDialogDefaultValue(MaxScaleBreastsDefault)
		SetSliderDialogRange(1, 10)
		SetSliderDialogInterval(0.1)

	ElseIf option == OIDPregnancyDuration
		
		SetSliderDialogStartValue(PregnancyDuration)
		SetSliderDialogDefaultValue(PregnancyDurationDefault)
		SetSliderDialogRange(1, 270)
		SetSliderDialogInterval(1)
		
	ElseIf option == OIDSoulGemDuration
		
		SetSliderDialogStartValue(SoulGemDuration)
		SetSliderDialogDefaultValue(SoulGemDurationDefault)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
		
	ElseIf option == OIDSoulGemsMax
		
		SetSliderDialogStartValue(SoulGemsMax)
		SetSliderDialogDefaultValue(SoulGemsMaxDefault)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
		
	ElseIf option == OIDSoulGemBellySize
		
		SetSliderDialogStartValue(SoulGemBellySize)
		SetSliderDialogDefaultValue(SoulGemBellySizeDefault)
		SetSliderDialogRange(0, 10)
		SetSliderDialogInterval(0.1)
		
	EndIf
	
EndEvent

event OnOptionMenuOpen(int option)
	if (option == OIDPregnancyActorOptions)
	
		SetMenuDialogOptions(PregnancyActorOptions)
		SetMenuDialogStartIndex(PregnancyActorOption)
		SetMenuDialogDefaultIndex(PregnancyActorOption)
		
	elseif (option == OIDBirthTypeOptions)
	
		SetMenuDialogOptions(BirthTypeOptions)
		SetMenuDialogStartIndex(BirthTypeOption)
		SetMenuDialogDefaultIndex(BirthTypeOption)

	elseif (option == OIDBodyTypeOptions)
	
		SetMenuDialogOptions(BodyTypeOptions)
		SetMenuDialogStartIndex(BodyTypeOption)
		SetMenuDialogDefaultIndex(BodyTypeOption)	
			
	endIf
endEvent


event OnOptionMenuAccept(int option, int index)
	if (option == OIDPregnancyActorOptions)
	
		PregnancyActorOption = index
		SetMenuOptionValue(OIDPregnancyActorOptions, PregnancyActorOptions[PregnancyActorOption])
		
	elseif (option == OIDBirthTypeOptions)
	
		BirthTypeOption = index
		SetMenuOptionValue(OIDBirthTypeOptions, BirthTypeOptions[BirthTypeOption])
		
	elseif (option == OIDBodyTypeOptions)
	
		BodyTypeOption = index
		SetMenuOptionValue(OIDBodyTypeOptions, BodyTypeOptions[BodyTypeOption])
		
	endIf
endEvent

event OnOptionSelect(int option)
	if (option == OIDClearPregnancies && !ClearPregnancy)
	
		ClearPregnancy = true
		SetToggleOptionValue(OIDClearPregnancies, ClearPregnancy)
		hentaiPregnancyQuest.clearPregnancies()
		
	elseIf option == OIDPregnancyEffects
	
		PregnancyEffects = !PregnancyEffects
		SetToggleOptionValue(OIDPregnancyEffects, PregnancyEffects)
		
	elseIf option == OIDBellyScaling
	
		BellyScaling = !BellyScaling
		SetToggleOptionValue(OIDBellyScaling, BellyScaling)
		hentaiPregnancyQuest.UpdateBellyScaling()
		
	elseIf option == OIDBreastScaling
	
		BreastScaling = !BreastScaling
		SetToggleOptionValue(OIDBreastScaling, BreastScaling)
		hentaiPregnancyQuest.UpdateBreastScaling()
		
	elseIf option == OIDResetScaling
	
		ResetScaling = !ResetScaling
		SetToggleOptionValue(OIDResetScaling, ResetScaling)
		hentaiPregnancyQuest.ResetScaling()
		ResetScaling = !ResetScaling
		SetToggleOptionValue(OIDResetScaling, ResetScaling)
		
	elseIf option == OIDMilking
	
		Milking = !Milking
		SetToggleOptionValue(OIDMilking, Milking)
		
	elseIf option == OIDNPCMilking
	
		NPCMilking = !NPCMilking
		SetToggleOptionValue(OIDNPCMilking, NPCMilking)
		
	elseIf option == OIDMilkAll
	
		MilkAll = !MilkAll
		SetToggleOptionValue(OIDMilkAll, MilkAll)
		
	elseIf option == OIDPostPregnancyEffects
	
		PostPregnancyEffects = !PostPregnancyEffects
		SetToggleOptionValue(OIDPostPregnancyEffects, PostPregnancyEffects)
		
	elseIf option == OIDAllowAnal
	
		AllowAnal = !AllowAnal
		SetToggleOptionValue(OIDAllowAnal, AllowAnal)
		
	elseIf option == OIDAllowNonUnique
	
		AllowNonUnique = !AllowNonUnique
		SetToggleOptionValue(OIDAllowNonUnique, AllowNonUnique)
		
	elseIf option == OIDCumInflationCreaturesOnly
	
		CumInflationCreaturesOnly = !CumInflationCreaturesOnly
		SetToggleOptionValue(OIDCumInflationCreaturesOnly, CumInflationCreaturesOnly)
		
	elseIf option == OIDEnableMessages
	
		EnableMessages = !EnableMessages
		SetToggleOptionValue(OIDEnableMessages, EnableMessages)
		
	elseIf option == OIDSoulGemPregnancy
	
		SoulGemPregnancy = !SoulGemPregnancy
		SetToggleOptionValue(OIDSoulGemPregnancy, SoulGemPregnancy)
		
	elseIf option == OIDForcedOnly
	
		ForcedOnly = !ForcedOnly
		SetToggleOptionValue(OIDForcedOnly, ForcedOnly)
		
	elseIf option == OIDCreaturesOnly
	
		CreaturesOnly = !CreaturesOnly
		SetToggleOptionValue(OIDCreaturesOnly, CreaturesOnly)
		
	endIf

	int i = 0
	while (i < OIDClearSinglePregnancy.Length)
		if (option == OIDClearSinglePregnancy[i])
			hentaiPregnancyQuest.clearSinglePregnancy(i)
			ForcePageReset()
		endIf
		i = i + 1
	endWhile
endEvent

Event OnOptionHighlight(int option)
	
	If option == OIDPregnancyChance
		SetInfoText("$HP_MCM_PregnancyChanceDescription")
		
	ElseIf option == OIDBodyTypeOptions
		SetInfoText("$HP_MCM_MilkingBodyTypeOptionDescription")
		
	ElseIf option == OIDChildChance
		SetInfoText("$HP_MCM_PregnancyChildChanceDescription")
		
	ElseIf option == OIDCumInflationChance
		SetInfoText("$HP_MCM_CumInflationChanceDescription")	
		
	ElseIf option == OIDCumInflationCreaturesOnly
		SetInfoText("$HP_MCM_CumInflationCreaturesOnlyDescription")	
		
	ElseIf option == OIDPregnancyDuration
		SetInfoText("$HP_MCM_PregnancyDurationDescription")
		
	ElseIf option == OIDMaxScaleBelly
		SetInfoText("$HP_MCM_MaxScaleBellyDescription")
		
	ElseIf option == OIDMaxScaleBreasts
		SetInfoText("$HP_MCM_MaxScaleBreastsDescription")
		
	ElseIf option == OIDPregnancyActorOptions
		SetInfoText("$HP_MCM_PregnancyActorOptionDescription")	
		
	ElseIf option == OIDBirthTypeOptions
		SetInfoText("$HP_MCM_PregnancyBirthTypeOptionDescription")	
		
	ElseIf option == OIDClearPregnancies
		SetInfoText("$HP_MCM_ClearPregnancyDescription")	
		
	ElseIf option == OIDPregnancyEffects
		SetInfoText("$HP_MCM_PregnancyEffectsDescription")	
		
	ElseIf option == OIDBreastScaling
		SetInfoText("$HP_MCM_BreastScalingDescription")	
		
	ElseIf option == OIDResetScaling
		SetInfoText("$HP_MCM_ResetScalingDescription")	
		
	ElseIf option == OIDBellyScaling
		SetInfoText("$HP_MCM_BellyScalingDescription")	
		
	ElseIf option == OIDMilking
		SetInfoText("$HP_MCM_MilkingDescription")
		
	ElseIf option == OIDNPCMilking
		SetInfoText("$HP_MCM_NPCMilkingDescription")
		
	ElseIf option == OIDMilkAll
		SetInfoText("$HP_MCM_MilkAllDescription")
		
	ElseIf option == OIDPostPregnancyEffects
		SetInfoText("$HP_MCM_PregnancyPostPregnancyEffectsDescription")
		
	ElseIf option == OIDAllowAnal
		SetInfoText("$HP_MCM_PregnancyAllowAnalDescription")
		
	ElseIf option == OIDAllowNonUnique
		SetInfoText("$HP_MCM_PregnancyAllowNonUniqueDescription")
		
	ElseIf option == OIDEnableMessages
		SetInfoText("$HP_MCM_EnableMessagesDescription")
		
	ElseIf option == OIDSoulGemDuration
		SetInfoText("$HP_MCM_SoulGemDurationDescription")
		
	ElseIf option == OIDSoulGemsMax
		SetInfoText("$HP_MCM_SoulGemsMaxDescription")
		
	ElseIf option == OIDSoulGemBellySize
		SetInfoText("$HP_MCM_SoulGemBellySizeDescription")
		
	ElseIf option == OIDSoulGemPregnancy
		SetInfoText("$HP_MCM_SoulGemPregnancyDescription")
		
	ElseIf option == OIDForcedOnly
		SetInfoText("$HP_MCM_SoulGemForcedOnlyDescription")
		
	ElseIf option == OIDCreaturesOnly
		SetInfoText("$HP_MCM_SoulGemCreaturesOnlyDescription")
		
	EndIf
	
EndEvent

function pregnanciesCleared()
	ClearPregnancy = false
	SetToggleOptionValue(OIDClearPregnancies, ClearPregnancy)
	ForcePageReset()
endfunction

event OnGameReload()
	parent.OnGameReload() ; Don't forget to call the parent!
	
	hentaiPregnancyQuest.gameLoaded()

endEvent

string[] function getPregnancyList()
	string[] plist = new string[50]
	OIDClearSinglePregnancy = new int[50]
	int i = 0
	while i < hentaiPregnancyQuest.PregnantActors.Length
		if hentaiPregnancyQuest.PregnantActors[i].GetActorRef() != none
			;pregnancy hours left
			int Remainder = hentaiPregnancyQuest.PregnantActors[i].getDurationHours() - hentaiPregnancyQuest.PregnantActors[i].getCurrentHour()
			string TimeDesc = hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(0)
			if Remainder > 24
				;pregnancy days left
				Remainder = Remainder / 24
				TimeDesc = hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(1)
			elseif hentaiPregnancyQuest.PregnantActors[i].getState() == "PostPregnancy"
				;postpregnancy hours left
				Remainder = Remainder + hentaiPregnancyQuest.PregnantActors[i].getPostDurationHours()
				TimeDesc += hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(2)
				if Remainder > 24
					;postpregnancy days left
					Remainder = Remainder / 24
					TimeDesc = hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(1) + hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(2)
				endif
			endif
			;(soulgem)(post)pregnancy days, hours left
			plist[i] = plist[i] + hentaiPregnancyQuest.PregnantActors[i].getMother().GetLeveledActorBase().GetName() + hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(3) + hentaiPregnancyQuest.PregnantActors[i].getFather().GetLeveledActorBase().GetName() + " ~ " + Remainder + TimeDesc
		endif
		i += 1
	endWhile
	return plist
endFunction