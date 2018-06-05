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

int OIDPostPregnancyEffects
bool Property PostPregnancyEffects = true Auto Hidden

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

int Property SoulGemDuration = 10 Auto Hidden
int SoulGemDurationDefault = 10
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
	return 20180505
endFunction

event OnVersionUpdate(int a_version)
	if (a_version > 1)
		Debug.Trace(self + ": Updating script to version " + a_version)
		;if (a_version >= 1050 && CurrentVersion < 1050)
		
		;endIf
	endIf
endEvent

Function RefreshStrings()
	Pages = new string[3]
	Pages[0] = "$HP_MCM_Pages1"
	Pages[1] = "$HP_MCM_Pages2"
	Pages[2] = "$HP_MCM_Pages3"
	
	PregnancyActorOptions = new string[2]
	PregnancyActorOptions[0] = "$HP_MCM_PregnancyActorOptions1"
	PregnancyActorOptions[1] = "$HP_MCM_PregnancyActorOptions2"
	
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
	self.RefreshStrings()
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			AddHeaderOption("$HP_MCM_Pages1_PregnancySettingsHeader")
		
				OIDPregnancyActorOptions = AddMenuOption("$HP_MCM_Pages1_PregnancyActorOptions", PregnancyActorOptions[PregnancyActorOption])
				OIDAllowAnal = AddToggleOption("$HP_MCM_Pages1_AllowAnal", AllowAnal)
				OIDAllowNonUnique = AddToggleOption("$HP_MCM_Pages1_AllowNonUnique", AllowNonUnique)
				OIDCumInflationCreaturesOnly = AddToggleOption("$HP_MCM_Pages1_CumInflationCreaturesOnly", CumInflationCreaturesOnly)
				
				OIDCumInflationChance = AddSliderOption("$HP_MCM_Pages1_CumInflationChance", CumInflationChance, "{0}%")
				OIDPregnancyChance = AddSliderOption("$HP_MCM_Pages1_PregnancyChance", PregnancyChance, "{0}%")
				OIDChildChance = AddSliderOption("$HP_MCM_Pages1_ChildChance", ChildChance, "{0}%")
;				OIDBirthTypeOptions = AddMenuOption("$HP_MCM_Pages1_BirthTypeOptions", BirthTypeOptions[BirthTypeOption])
				OIDPregnancyDuration = AddSliderOption("$HP_MCM_Pages1_PregnancyDuration", PregnancyDuration, "$HP_Days")
				AddEmptyOption()

				OIDPregnancyEffects = AddToggleOption("$HP_MCM_Pages1_PregnancyEffects", PregnancyEffects)
;				OIDPostPregnancyEffects = AddToggleOption("$HP_MCM_Pages1_PostPregnancyEffects", PostPregnancyEffects)
				OIDMilking = AddToggleOption("$HP_MCM_Pages1_Milking", Milking)
				OIDNPCMilking = AddToggleOption("$HP_MCM_Pages1_NPCMilking", NPCMilking)
				OIDBodyTypeOptions = AddMenuOption("$HP_MCM_Pages1_BodyTypeOptions", BodyTypeOptions[BodyTypeOption])
				AddEmptyOption()
				
				OIDEnableMessages = AddToggleOption("$HP_MCM_Pages1_EnableMessages", EnableMessages)

		SetCursorPosition(1)
			AddHeaderOption("$HP_MCM_Pages1_BodyScalingHeader")

				OIDBellyScaling = AddToggleOption("$HP_MCM_Pages1_BellyScaling", BellyScaling)
				OIDMaxScaleBelly = AddSliderOption("$HP_MCM_Pages1_MaxScaleBelly", MaxScaleBelly, "{1}")

				OIDBreastScaling = AddToggleOption("$HP_MCM_Pages1_BreastScaling", BreastScaling)
				OIDMaxScaleBreasts = AddSliderOption("$HP_MCM_Pages1_MaxScaleBreasts", MaxScaleBreasts, "{1}")

				AddEmptyOption()
				OIDResetScaling = AddToggleOption("$HP_MCM_Pages1_ResetScaling", ResetScaling)
				
	ElseIf page == "$HP_MCM_Pages2"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			AddHeaderOption("$HP_MCM_Pages2_SoulGemHeader")

			OIDSoulGemPregnancy = AddToggleOption("$HP_MCM_Pages2_SoulGemPregnancy", SoulGemPregnancy)
			OIDCreaturesOnly = AddToggleOption("$HP_MCM_Pages2_SoulGemCreaturesOnly", CreaturesOnly)
			;OIDForcedOnly = AddToggleOption("$HP_MCM_Pages2_SoulGemForcedOnly", ForcedOnly)
			OIDSoulGemDuration = AddSliderOption("$HP_MCM_Pages2_SoulGemDuration", SoulGemDuration, "$HP_Hours")
			OIDSoulGemsMax = AddSliderOption("$HP_MCM_Pages2_SoulGemsMax", SoulGemsMax, "{0}")
			OIDSoulGemBellySize = AddSliderOption("$HP_MCM_Pages2_SoulGemBellySize", SoulGemBellySize, "{1}")
		
	ElseIf page == "$HP_MCM_Pages3"
	
		SetCursorFillMode(LEFT_TO_RIGHT)
		
		SetCursorPosition(0)
		
		AddTextOption("$HP_MCM_Pages3_Pregnancies", "", OPTION_FLAG_DISABLED)
		OIDClearPregnancies = AddToggleOption("$HP_MCM_Pages3_ClearPregnancies", ClearPregnancy)
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
						OIDClearSinglePregnancy[i] = AddTextOption("", "$HP_MCM_Pages3_ClearPregnancy")
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
		SetInfoText("$HP_MCM_BodyTypeOptionDescription")
		
	ElseIf option == OIDChildChance
		SetInfoText("$HP_MCM_ChildChanceDescription")
		
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
		SetInfoText("$HP_MCM_BirthTypeOptionDescription")	
		
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
		
	ElseIf option == OIDPostPregnancyEffects
		SetInfoText("$HP_MCM_PostPregnancyEffectsDescription")
		
	ElseIf option == OIDAllowAnal
		SetInfoText("$HP_MCM_AllowAnalDescription")
		
	ElseIf option == OIDAllowNonUnique
		SetInfoText("$HP_MCM_AllowNonUniqueDescription")
		
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
		SetInfoText("$HP_MCM_ForcedOnlyDescription")
		
	ElseIf option == OIDCreaturesOnly
		SetInfoText("$HP_MCM_CreaturesOnlyDescription")
		
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
			if hentaiPregnancyQuest.PregnantActors[i].getSoulGemCount() > 0
				;plist[i] = "[S:"+ hentaiPregnancyQuest.PregnantActors[i].getSoulGemCount()+"] "
				plist[i] = "*"
			endif
			plist[i] = plist[i] + hentaiPregnancyQuest.PregnantActors[i].getMother().GetLeveledActorBase().GetName() + hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(3) + hentaiPregnancyQuest.PregnantActors[i].getFather().GetLeveledActorBase().GetName() + " ~ " + Remainder + TimeDesc
		endif
		i += 1
	endWhile
	return plist
endFunction
