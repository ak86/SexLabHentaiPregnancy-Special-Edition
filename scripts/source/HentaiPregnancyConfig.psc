ScriptName HentaiPregnancyConfig extends SKI_ConfigBase

HentaiPregnancy Property hentaiPregnancyQuest auto



; ----- Mod settings -----

int OIDEnableMessages
bool Property EnableMessages = true Auto Hidden

Int Property Hotkey Auto Hidden

int OIDMilkpumpsStrip
bool Property MilkpumpsStrip = false Auto Hidden

int OIDMilkpumpsPlayAnimation
bool Property MilkpumpsPlayAnimation = true Auto Hidden

int OIDMilkpumpsCuminflationMode
int Property MilkpumpsCuminflationMode = 0 Auto Hidden
string[] MilkpumpsCuminflationOptions

;nie/nio node scaling
int OIDMaxScaleBelly
Float Property MaxScaleBelly = 3.0 Auto Hidden
Float MaxScaleBellyDefault = 3.0

int OIDMaxScaleBreasts
Float Property MaxScaleBreasts = 3.0 Auto Hidden
Float MaxScaleBreastsDefault = 3.0

int OIDMaxScaleBodyWeight
Float Property MaxScaleBodyWeight = 50.0 Auto Hidden
Float MaxScaleBodyWeightDefault = 50.0

int OIDBreastScaling
bool Property BreastScaling = false Auto Hidden

int OIDBellyScaling
bool Property BellyScaling = false Auto Hidden

int OIDBodyWeightScaling
bool Property BodyWeightScaling = false Auto Hidden

;morph scaling
;pregnancy breast
int OIDBreastsSH
Float Property BreastsSH = 0.5 Auto Hidden
Float BreastsSHDefault = 0.5

int OIDBreastsSSH
Float Property BreastsSSH = 0.5 Auto Hidden
Float BreastsSSHDefault = 0.5

int OIDBreastGravity
Float Property BreastGravity = 0.5 Auto Hidden
Float BreastGravityDefault = 0.5

int OIDNippleAreola
Float Property NippleAreola = 1.0 Auto Hidden
Float NippleAreolaDefault = 1.0

;pregnancy belly
int OIDChubbyArms
Float Property ChubbyArms = 0.5 Auto Hidden
Float ChubbyArmsDefault = 0.5

Float Property ChubbyWaist = 0.5 Auto Hidden
Float ChubbyWaistDefault = 0.5
int OIDChubbyWaist

int OIDChubbyButt
Float Property ChubbyButt = 0.5 Auto Hidden
Float ChubbyButtDefault = 0.5

int OIDChubbyLegs
Float Property ChubbyLegs = 0.5 Auto Hidden
Float ChubbyLegsDefault = 0.5

int OIDButtShape2
Float Property ButtShape2 = 0.5 Auto Hidden
Float ButtShape2Default = 0.5

int OIDPregnancyBelly
Float Property PregnancyBelly = 0.5 Auto Hidden
Float PregnancyBellyDefault = 0.5

;pregnancy milk
int OIDDoubleMelon
Float Property DoubleMelon = 1.0 Auto Hidden
Float DoubleMelonDefault = 1.0

int OIDNipplePerkiness
Float Property NipplePerkiness = 1.0 Auto Hidden
Float NipplePerkinessDefault = 1.0

int OIDNippleLength
Float Property NippleLength = 1.0 Auto Hidden
Float NippleLengthDefault = 1.0

int OIDResetScaling
bool Property ResetScaling = false Auto Hidden

; ----- Pregnancy settings -----

int OIDPregnancyChance
int Property PregnancyChance = 15 Auto Hidden
int PregnancyChanceDefault = 15

int OIDChildChance
int Property ChildChance = 100 Auto Hidden
int ChildChanceDefault = 100

int OIDPregnancyDuration
int Property PregnancyDuration = 7 Auto Hidden
int PregnancyDurationDefault = 7

int OIDPregnancyActorOptions
int Property PregnancyActorOption = 0 Auto Hidden
string[] PregnancyActorOptions

int OIDBirthTypeOptions
int Property BirthTypeOption = 0 Auto Hidden
string[] BirthTypeOptions

int OIDPregnancyEffects
bool Property PregnancyEffects = true Auto Hidden

int OIDPostPregnancyEffects
bool Property PostPregnancyEffects = false Auto Hidden

int OIDAllowAnal
bool Property AllowAnal = false Auto Hidden

int OIDAllowNonUnique
bool Property AllowNonUnique = true Auto Hidden

int OIDClearPregnancies
bool ClearPregnancy = false
int[] OIDClearSinglePregnancy



; ----- Milking settings -----

int OIDPCMilking
bool Property PCMilking = true Auto Hidden

int OIDNPCMilking
bool Property NPCMilking = true Auto Hidden

int OIDNPCSelfMilking
bool Property NPCSelfMilking = false Auto Hidden

int OIDMilkAllPC
bool Property MilkAllPC = false Auto Hidden

int OIDMilkAllNPC
bool Property MilkAllNPC = false Auto Hidden

int OIDMilkBegin
int property MilkBegin = 50 Auto Hidden
int MilkBeginDefault = 50

int OIDBodyTypeOptions
int Property BodyTypeOption = 0 Auto Hidden
string[] BodyTypeOptions



; ----- Cum Inflation settings -----

int OIDCumInflationChance
int Property CumInflationChance = 50 Auto Hidden
int CumInflationChanceDefault = 50

int OIDCumInflationCreaturesOnly
bool Property CumInflationCreaturesOnly = true Auto Hidden

int OIDCumInflation
bool Property CumInflation = true Auto Hidden

int OIDCumSizeBase
Float Property CumSizeBase = 15.0 Auto Hidden
Float CumSizeBaseDefault = 15.0

int OIDCumSizeRandomizer
Float Property CumSizeRandomizer = 50.0 Auto Hidden
Float CumSizeRandomizerDefault = 50.0

int OIDCumSizeCreatureModifier
Float Property CumSizeCreatureModifier = 10.0 Auto Hidden
Float CumSizeCreatureModifierDefault = 10.0

int OIDCumSizeEstrusModifier
Float Property CumSizeEstrusModifier = 100.0 Auto Hidden
Float CumSizeEstrusModifierDefault = 100.0

int OIDCumAbsorb
Float Property CumAbsorb = 10.0 Auto Hidden
Float CumAbsorbDefault = 10.0

int OIDCumDrain
Float Property CumDrain = 10.0 Auto Hidden
Float CumDrainDefault = 10.0

int OIDCumBellySizeMax
Float Property CumBellySizeMax = 3.5 Auto Hidden
Float CumBellySizeMaxDefault = 3.5

int OIDCumBellySizeMaxRandomizer
Float Property CumBellySizeMaxRandomizer = 10.0 Auto Hidden
Float CumBellySizeMaxRandomizerDefault = 10.0

int OIDCumBellySizePerCum
Float Property CumBellySizePerCum = 1.5 Auto Hidden
Float CumBellySizePerCumDefault = 1.5



; ----- Soul Gem settings -----

int OIDSoulGemDuration
int Property SoulGemDuration = 20 Auto Hidden
int SoulGemDurationDefault = 20

int OIDSoulGemBellySize
Float Property SoulGemBellySize = 1.0 Auto Hidden
Float SoulGemBellySizeDefault = 1.0

int OIDSoulGemPregnancy
bool Property SoulGemPregnancy = false Auto Hidden

int OIDForcedOnly
bool Property ForcedOnly = false Auto Hidden

int OIDCreaturesOnly
bool Property CreaturesOnly = true Auto Hidden



; ----- MCM part -----

Event OnConfigInit()
	self.RefreshStrings()
EndEvent

int function GetVersion()
	return 20190323
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
	
	MilkpumpsCuminflationOptions = new string[3]
	MilkpumpsCuminflationOptions[0] = "$HP_MCM_MilkpumpsCuminflationOptions1"
	MilkpumpsCuminflationOptions[1] = "$HP_MCM_MilkpumpsCuminflationOptions2"
	MilkpumpsCuminflationOptions[2] = "$HP_MCM_MilkpumpsCuminflationOptions3"
EndFunction

Event OnPageReset(string page)
	{Called when a new page is selected, including the initial empty page}
	
	if page == ""
		self.RefreshStrings()
		
	ElseIf page == "$HP_MCM_Pages1"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			OIDEnableMessages = AddToggleOption("$HP_MCM_EnableMessages", EnableMessages)
			AddKeyMapOptionST("Hotkey", "$HP_MCM_Hotkey", Hotkey)
			AddEmptyOption()

			AddHeaderOption("$HP_MCM_MilkpumpsHeader")
			OIDMilkpumpsStrip = AddToggleOption("$HP_MCM_MilkpumpsStrip", MilkpumpsStrip)
			OIDMilkpumpsPlayAnimation = AddToggleOption("$HP_MCM_MilkpumpsPlayAnimation", MilkpumpsPlayAnimation)
			OIDMilkpumpsCuminflationMode = AddMenuOption("$HP_MCM_MilkpumpsCuminflationMode", MilkpumpsCuminflationOptions[MilkpumpsCuminflationMode])
			
		SetCursorPosition(1)
			AddHeaderOption("$HP_MCM_BodyScalingHeader")

				OIDBellyScaling = AddToggleOption("$HP_MCM_BellyScaling", BellyScaling)
				OIDMaxScaleBelly = AddSliderOption("$HP_MCM_MaxScaleBelly", MaxScaleBelly, "{1}")

				OIDBreastScaling = AddToggleOption("$HP_MCM_BreastScaling", BreastScaling)
				OIDMaxScaleBreasts = AddSliderOption("$HP_MCM_MaxScaleBreasts", MaxScaleBreasts, "{1}")
				OIDBodyWeightScaling = AddToggleOption("$HP_MCM_BodyWeightScaling", BodyWeightScaling)
				OIDMaxScaleBodyWeight = AddSliderOption("$HP_MCM_MaxScaleBodyWeight", MaxScaleBodyWeight, "{1}")
				AddEmptyOption()

			AddHeaderOption("$HP_MCM_BodyMorphingHeader")

				AddTextOption("0=0%, 1=100%", "", OPTION_FLAG_DISABLED)
				AddTextOption("$HP_MCM_PregnancyBreast", "", OPTION_FLAG_DISABLED)
				OIDBreastsSH = AddSliderOption("$HP_MCM_BreastsSH", BreastsSH, "{2}")
				OIDBreastsSSH = AddSliderOption("$HP_MCM_BreastsSSH", BreastsSSH, "{2}")
				OIDBreastGravity = AddSliderOption("$HP_MCM_BreastGravity", BreastGravity, "{2}")
				OIDNippleAreola = AddSliderOption("$HP_MCM_NippleAreola", NippleAreola, "{2}")
				AddEmptyOption()
				
				AddTextOption("$HP_MCM_PregnancyBelly", "", OPTION_FLAG_DISABLED)
				OIDChubbyArms = AddSliderOption("$HP_MCM_ChubbyArms", ChubbyArms, "{2}")
				OIDChubbyWaist = AddSliderOption("$HP_MCM_ChubbyWaist", ChubbyWaist, "{2}")
				OIDChubbyButt = AddSliderOption("$HP_MCM_ChubbyButt", ChubbyButt, "{2}")
				OIDChubbyLegs = AddSliderOption("$HP_MCM_ChubbyLegs", ChubbyLegs, "{2}")
				OIDButtShape2 = AddSliderOption("$HP_MCM_ButtShape2", ButtShape2, "{2}")
				OIDPregnancyBelly = AddSliderOption("$HP_MCM_PregnancyBelly", PregnancyBelly, "{2}")
				AddEmptyOption()

				AddTextOption("$HP_MCM_PregnancyMilk", "", OPTION_FLAG_DISABLED)
				OIDDoubleMelon = AddSliderOption("$HP_MCM_DoubleMelon", DoubleMelon, "{2}")
				OIDNipplePerkiness = AddSliderOption("$HP_MCM_NipplePerkiness", NipplePerkiness, "{2}")
				OIDNippleLength = AddSliderOption("$HP_MCM_NippleLength", NippleLength, "{2}")
				AddEmptyOption()
				
				OIDResetScaling = AddToggleOption("$HP_MCM_ResetScaling", ResetScaling)
				
	ElseIf page == "$HP_MCM_Pages2"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			AddHeaderOption("$HP_MCM_FemaleCycleHeader")
			;OIDPlayerFemaleCycle = AddToggleOption("$HP_MCM_PlayerFemaleCycle", PlayerFemaleCycle)
			
		SetCursorPosition(1)
			AddHeaderOption("$HP_MCM_FemaleCycleEffectsHeader")
			AddTextOption("$HP_MCM_PlayerPregnancyChance", PregnancyChance + StorageUtil.GetIntValue(hentaiPregnancyQuest.PlayerRef, "hp_fetility_modifier", 0) + "%", OPTION_FLAG_DISABLED)

	ElseIf page == "$HP_MCM_Pages3"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			;OIDCumInflationChance = AddSliderOption("$HP_MCM_CumInflationChance", CumInflationChance, "{0}%")
			;OIDCumInflationCreaturesOnly = AddToggleOption("$HP_MCM_CumInflationCreaturesOnly", CumInflationCreaturesOnly)

			AddHeaderOption("$HP_MCM_CumInflationHeader")
			OIDCumInflation = AddToggleOption("$HP_MCM_CumInflation", CumInflation)
			OIDCumSizeBase = AddSliderOption("$HP_MCM_CumSizeBase", CumSizeBase, "{0}")
			OIDCumSizeRandomizer = AddSliderOption("$HP_MCM_CumSizeRandomizer", CumSizeRandomizer, "{0}%")
			OIDCumSizeCreatureModifier = AddSliderOption("$HP_MCM_CumSizeCreatureModifier", CumSizeCreatureModifier, "{0}")
			OIDCumSizeEstrusModifier = AddSliderOption("$HP_MCM_CumSizeEstrusModifier", CumSizeEstrusModifier, "{0}")
			OIDCumAbsorb = AddSliderOption("$HP_MCM_CumAbsorb", CumAbsorb, "{0}")
			OIDCumDrain = AddSliderOption("$HP_MCM_CumDrain", CumDrain, "{0}")

		SetCursorPosition(1)
			AddHeaderOption("$HP_MCM_CumInflationBellySettingHeader")
			OIDCumBellySizeMax = AddSliderOption("$HP_MCM_CumBellySizeMax", CumBellySizeMax, "{1}")
			OIDCumBellySizeMaxRandomizer = AddSliderOption("$HP_MCM_CumBellySizeMaxRandomizer", CumBellySizeMaxRandomizer, "{0}%")
			OIDCumBellySizePerCum = AddSliderOption("$HP_MCM_CumBellySizePerCum", CumBellySizePerCum, "{1}")
		
	ElseIf page == "$HP_MCM_Pages4"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			AddHeaderOption("$HP_MCM_MilkingHeader")
			OIDPCMilking = AddToggleOption("$HP_MCM_PCMilking", PCMilking)
			OIDNPCMilking = AddToggleOption("$HP_MCM_NPCMilking", NPCMilking)
			OIDNPCSelfMilking = AddToggleOption("$HP_MCM_NPCSelfMilking", NPCSelfMilking)
			OIDMilkAllPC = AddToggleOption("$HP_MCM_MilkAllPC", MilkAllPC)
			OIDMilkAllNPC = AddToggleOption("$HP_MCM_MilkAllNPC", MilkAllNPC)
			OIDMilkBegin = AddSliderOption("$HP_MCM_MilkBegin", MilkBegin, "{0}")
			OIDBodyTypeOptions = AddMenuOption("$HP_MCM_MilkingBodyTypeOptions", BodyTypeOptions[BodyTypeOption])
		
	ElseIf page == "$HP_MCM_Pages5"
	
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
	
	ElseIf page == "$HP_MCM_Pages6"
		
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
			AddHeaderOption("$HP_MCM_SoulGemHeader")

			OIDSoulGemPregnancy = AddToggleOption("$HP_MCM_SoulGemPregnancy", SoulGemPregnancy)
			OIDCreaturesOnly = AddToggleOption("$HP_MCM_SoulGemCreaturesOnly", CreaturesOnly)
			;OIDForcedOnly = AddToggleOption("$HP_MCM_SoulGemForcedOnly", ForcedOnly)
			OIDSoulGemDuration = AddSliderOption("$HP_MCM_SoulGemDuration", SoulGemDuration, "$HP_Hours")
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
						
						AddTextOption("$HP_MCM_CumInflatedstate", hentaiPregnancyQuest.PregnantActors[i].getCumInflation()/1000, OPTION_FLAG_DISABLED)
						AddTextOption("$HP_MCM_Milk", hentaiPregnancyQuest.PregnantActors[i].getMilk(), OPTION_FLAG_DISABLED)
						
						form SoulGemType = hentaiPregnancyQuest.getSoulGemSize(hentaiPregnancyQuest.PregnantActors[i].getId())
						if SoulGemType != none
							AddTextOption(SoulGemType.GetName(), hentaiPregnancyQuest.PregnantActors[i].getSoulGemCount(), OPTION_FLAG_DISABLED)
						else
							AddTextOption("None", hentaiPregnancyQuest.PregnantActors[i].getSoulGemCount(), OPTION_FLAG_DISABLED)
						endIf
						AddTextOption("", "", OPTION_FLAG_DISABLED)
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
		
	ElseIf option == OIDMilkBegin
		
		SetSliderOptionValue(option, floatValue, "{0}%")
		MilkBegin = floatValue as int
		
	ElseIf option == OIDCumInflationChance
		
		SetSliderOptionValue(option, floatValue, "{0}%")
		CumInflationChance = value
		
	ElseIf option == OIDCumSizeBase
		
		SetSliderOptionValue(option, floatValue, "{0}")
		CumSizeBase = value
		
	ElseIf option == OIDCumSizeRandomizer
		
		SetSliderOptionValue(option, floatValue, "{0}%")
		CumSizeRandomizer = value
		
	ElseIf option == OIDCumSizeCreatureModifier
		
		SetSliderOptionValue(option, floatValue, "{0}")
		CumSizeCreatureModifier = value
		
	ElseIf option == OIDCumSizeEstrusModifier
		
		SetSliderOptionValue(option, floatValue, "{0}")
		CumSizeEstrusModifier = value
		
	ElseIf option == OIDCumAbsorb
		
		SetSliderOptionValue(option, floatValue, "{0}")
		CumAbsorb = value
		
	ElseIf option == OIDCumDrain
		
		SetSliderOptionValue(option, floatValue, "{0}")
		CumDrain = value
		
	ElseIf option == OIDCumBellySizeMax
		
		SetSliderOptionValue(option, floatValue, "{1}")
		CumBellySizeMax = floatValue
		
	ElseIf option == OIDCumBellySizeMaxRandomizer
		
		SetSliderOptionValue(option, floatValue, "{0}%")
		CumBellySizeMaxRandomizer = value
		
	ElseIf option == OIDCumBellySizePerCum
		
		SetSliderOptionValue(option, floatValue, "{1}")
		CumBellySizePerCum = floatValue
		
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
		
	ElseIf option == OIDMaxScaleBodyWeight
	
		SetSliderOptionValue(option, floatValue, "{1}")
		MaxScaleBodyWeight = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDBreastsSH
		
		SetSliderOptionValue(option, floatValue, "{2}")
		BreastsSH = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDBreastsSSH
		
		SetSliderOptionValue(option, floatValue, "{2}")
		BreastsSSH = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDBreastGravity
		
		SetSliderOptionValue(option, floatValue, "{2}")
		BreastGravity = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDNippleAreola
		
		SetSliderOptionValue(option, floatValue, "{2}")
		NippleAreola = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDDoubleMelon
		
		SetSliderOptionValue(option, floatValue, "{2}")
		DoubleMelon = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDNipplePerkiness
		
		SetSliderOptionValue(option, floatValue, "{2}")
		NipplePerkiness = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDNippleLength
		
		SetSliderOptionValue(option, floatValue, "{2}")
		NippleLength = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDChubbyArms
		
		SetSliderOptionValue(option, floatValue, "{2}")
		ChubbyArms = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDChubbyWaist
		
		SetSliderOptionValue(option, floatValue, "{2}")
		ChubbyWaist = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDChubbyButt
		
		SetSliderOptionValue(option, floatValue, "{2}")
		ChubbyButt = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDChubbyLegs
		
		SetSliderOptionValue(option, floatValue, "{2}")
		ChubbyLegs = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDButtShape2
		
		SetSliderOptionValue(option, floatValue, "{2}")
		ButtShape2 = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDPregnancyBelly
		
		SetSliderOptionValue(option, floatValue, "{2}")
		PregnancyBelly = floatValue
		hentaiPregnancyQuest.UpdateTargetSize()
		hentaiPregnancyQuest.UpdateSize()
		
	ElseIf option == OIDPregnancyDuration
		
		SetSliderOptionValue(option, floatValue, "$HP_Days")
		PregnancyDuration = value
		hentaiPregnancyQuest.UpdatePregDuration()
		
	ElseIf option == OIDSoulGemDuration
		
		SetSliderOptionValue(option, floatValue, "$HP_Hours")
		SoulGemDuration = floatValue as int
		
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
	
	ElseIf option == OIDMilkBegin
	
		SetSliderDialogStartValue(MilkBegin)
		SetSliderDialogDefaultValue(MilkBeginDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
		
	ElseIf option == OIDCumInflationChance
		
		SetSliderDialogStartValue(CumInflationChance)
		SetSliderDialogDefaultValue(CumInflationChanceDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)	
		
	ElseIf option == OIDCumSizeBase
		
		SetSliderDialogStartValue(CumSizeBase)
		SetSliderDialogDefaultValue(CumSizeBaseDefault)
		SetSliderDialogRange(10, 1000)
		SetSliderDialogInterval(1)	
		
	ElseIf option == OIDCumSizeRandomizer
		
		SetSliderDialogStartValue(CumSizeRandomizer)
		SetSliderDialogDefaultValue(CumSizeRandomizerDefault)
		SetSliderDialogRange(0, 99)
		SetSliderDialogInterval(1)	
		
	ElseIf option == OIDCumSizeCreatureModifier
		
		SetSliderDialogStartValue(CumSizeCreatureModifier)
		SetSliderDialogDefaultValue(CumSizeCreatureModifierDefault)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)	
		
	ElseIf option == OIDCumSizeEstrusModifier
		
		SetSliderDialogStartValue(CumSizeEstrusModifier)
		SetSliderDialogDefaultValue(CumSizeEstrusModifierDefault)
		SetSliderDialogRange(1, 1000)
		SetSliderDialogInterval(1)	
		
	ElseIf option == OIDCumAbsorb
		
		SetSliderDialogStartValue(CumAbsorb)
		SetSliderDialogDefaultValue(CumAbsorbDefault)
		SetSliderDialogRange(0, 1000)
		SetSliderDialogInterval(1)	
		
	ElseIf option == OIDCumDrain
		
		SetSliderDialogStartValue(CumDrain)
		SetSliderDialogDefaultValue(CumDrainDefault)
		SetSliderDialogRange(10, 1000)
		SetSliderDialogInterval(1)	
		
	ElseIf option == OIDCumBellySizeMax
		
		SetSliderDialogStartValue(CumBellySizeMax)
		SetSliderDialogDefaultValue(CumBellySizeMaxDefault)
		SetSliderDialogRange(1, 10)
		SetSliderDialogInterval(0.1)	
		
	ElseIf option == OIDCumBellySizeMaxRandomizer
		
		SetSliderDialogStartValue(CumBellySizeMaxRandomizer)
		SetSliderDialogDefaultValue(CumBellySizeMaxRandomizerDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(10)	
		
	ElseIf option == OIDCumBellySizePerCum
		
		SetSliderDialogStartValue(CumBellySizePerCum)
		SetSliderDialogDefaultValue(CumBellySizePerCumDefault)
		SetSliderDialogRange(0.0, 10)
		SetSliderDialogInterval(0.1)	
		
	ElseIf option == OIDMaxScaleBelly
		
		SetSliderDialogStartValue(MaxScaleBelly)
		SetSliderDialogDefaultValue(MaxScaleBellyDefault)
		SetSliderDialogRange(2, 20)
		SetSliderDialogInterval(0.5)
		
	ElseIf option == OIDMaxScaleBreasts
		
		SetSliderDialogStartValue(MaxScaleBreasts)
		SetSliderDialogDefaultValue(MaxScaleBreastsDefault)
		SetSliderDialogRange(2, 10)
		SetSliderDialogInterval(0.1)
				
	ElseIf option == OIDMaxScaleBodyWeight
	
		SetSliderDialogStartValue(MaxScaleBodyWeight)
		SetSliderDialogDefaultValue(MaxScaleBodyWeightDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	
	ElseIf option == OIDBreastsSH
		
		SetSliderDialogStartValue(BreastsSH)
		SetSliderDialogDefaultValue(BreastsSHDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDBreastsSSH
		
		SetSliderDialogStartValue(BreastsSSH)
		SetSliderDialogDefaultValue(BreastsSSHDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDBreastGravity
		
		SetSliderDialogStartValue(BreastGravity)
		SetSliderDialogDefaultValue(BreastGravityDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDNippleAreola
		
		SetSliderDialogStartValue(NippleAreola)
		SetSliderDialogDefaultValue(NippleAreolaDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDDoubleMelon
		
		SetSliderDialogStartValue(DoubleMelon)
		SetSliderDialogDefaultValue(DoubleMelonDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDNipplePerkiness
		
		SetSliderDialogStartValue(NipplePerkiness)
		SetSliderDialogDefaultValue(NipplePerkinessDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDNippleLength
		
		SetSliderDialogStartValue(NippleLength)
		SetSliderDialogDefaultValue(NippleLengthDefault)
		SetSliderDialogRange(-10, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDChubbyArms
		
		SetSliderDialogStartValue(ChubbyArms)
		SetSliderDialogDefaultValue(ChubbyArmsDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDChubbyWaist
		
		SetSliderDialogStartValue(ChubbyWaist)
		SetSliderDialogDefaultValue(ChubbyWaistDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDChubbyButt
		
		SetSliderDialogStartValue(ChubbyButt)
		SetSliderDialogDefaultValue(ChubbyButtDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDChubbyLegs
		
		SetSliderDialogStartValue(ChubbyLegs)
		SetSliderDialogDefaultValue(ChubbyLegsDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDButtShape2
		
		SetSliderDialogStartValue(ButtShape2)
		SetSliderDialogDefaultValue(ButtShape2Default)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.1)
		
	ElseIf option == OIDPregnancyBelly
		
		SetSliderDialogStartValue(PregnancyBelly)
		SetSliderDialogDefaultValue(PregnancyBellyDefault)
		SetSliderDialogRange(0, 1)
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
		
	ElseIf option == OIDSoulGemBellySize
		
		SetSliderDialogStartValue(SoulGemBellySize)
		SetSliderDialogDefaultValue(SoulGemBellySizeDefault)
		SetSliderDialogRange(0.5, 10)
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

	elseif (option == OIDMilkpumpsCuminflationMode)
	
		SetMenuDialogOptions(MilkpumpsCuminflationOptions)
		SetMenuDialogStartIndex(MilkpumpsCuminflationMode)
		SetMenuDialogDefaultIndex(MilkpumpsCuminflationMode)

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
		
	elseif (option == OIDMilkpumpsCuminflationMode)
	
		MilkpumpsCuminflationMode = index
		SetMenuOptionValue(OIDMilkpumpsCuminflationMode, MilkpumpsCuminflationOptions[MilkpumpsCuminflationMode])
		
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
		
	elseIf option == OIDBodyWeightScaling
	
		BodyWeightScaling = !BodyWeightScaling
		SetToggleOptionValue(OIDBodyWeightScaling, BodyWeightScaling)
		hentaiPregnancyQuest.UpdateBodyWeightScaling()
		
	elseIf option == OIDResetScaling
	
		ResetScaling = !ResetScaling
		SetToggleOptionValue(OIDResetScaling, ResetScaling)
		hentaiPregnancyQuest.ResetScaling()
		ResetScaling = !ResetScaling
		SetToggleOptionValue(OIDResetScaling, ResetScaling)
		
	elseIf option == OIDPCMilking
	
		PCMilking = !PCMilking
		SetToggleOptionValue(OIDPCMilking, PCMilking)
		
	elseIf option == OIDNPCMilking
	
		NPCMilking = !NPCMilking
		SetToggleOptionValue(OIDNPCMilking, NPCMilking)
		
	elseIf option == OIDNPCSelfMilking
	
		NPCSelfMilking = !NPCSelfMilking
		SetToggleOptionValue(OIDNPCSelfMilking, NPCSelfMilking)
		
	elseIf option == OIDMilkAllPC
	
		MilkAllPC = !MilkAllPC
		SetToggleOptionValue(OIDMilkAllPC, MilkAllPC)
		
	elseIf option == OIDMilkAllNPC
	
		MilkAllNPC = !MilkAllNPC
		SetToggleOptionValue(OIDMilkAllNPC, MilkAllNPC)
		
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
		
	elseIf option == OIDCumInflation
	
		CumInflation = !CumInflation
		SetToggleOptionValue(OIDCumInflation, CumInflation)
		
	elseIf option == OIDEnableMessages
	
		EnableMessages = !EnableMessages
		SetToggleOptionValue(OIDEnableMessages, EnableMessages)
		
	elseIf option == OIDMilkpumpsStrip
	
		MilkpumpsStrip = !MilkpumpsStrip
		SetToggleOptionValue(OIDMilkpumpsStrip, MilkpumpsStrip)
		
	elseIf option == OIDMilkpumpsPlayAnimation
	
		MilkpumpsPlayAnimation = !MilkpumpsPlayAnimation
		SetToggleOptionValue(OIDMilkpumpsPlayAnimation, MilkpumpsPlayAnimation)
		
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
	
	If option == OIDEnableMessages
		SetInfoText("$HP_MCM_EnableMessagesDescription")
		
	ElseIf option == OIDMilkpumpsStrip
		SetInfoText("$HP_MCM_MilkpumpsStripDescription")
		
	ElseIf option == OIDMilkpumpsPlayAnimation
		SetInfoText("$HP_MCM_MilkpumpsPlayAnimationDescription")
		
	ElseIf option == OIDMilkpumpsCuminflationMode
		SetInfoText("$HP_MCM_MilkpumpsCuminflationModeDescription")	
		
	ElseIf option == OIDPregnancyChance
		SetInfoText("$HP_MCM_PregnancyChanceDescription")
		
	ElseIf option == OIDBodyTypeOptions
		SetInfoText("$HP_MCM_MilkingBodyTypeOptionDescription")
		
	ElseIf option == OIDMilkBegin
		SetInfoText("$HP_MCM_MilkBeginDescription")
		
	ElseIf option == OIDChildChance
		SetInfoText("$HP_MCM_PregnancyChildChanceDescription")
		
	ElseIf option == OIDCumInflationChance
		SetInfoText("$HP_MCM_CumInflationChanceDescription")	
		
	ElseIf option == OIDCumSizeBase
		SetInfoText("$HP_MCM_CumSizeBaseDescription")	
		
	ElseIf option == OIDCumSizeRandomizer
		SetInfoText("$HP_MCM_CumSizeRandomizerDescription")	
		
	ElseIf option == OIDCumSizeCreatureModifier
		SetInfoText("$HP_MCM_CumSizeCreatureModifierDescription")	
		
	ElseIf option == OIDCumSizeEstrusModifier
		SetInfoText("$HP_MCM_CumSizeEstrusModifierDescription")	
		
	ElseIf option == OIDCumAbsorb
		SetInfoText("$HP_MCM_CumAbsorbDescription")	
		
	ElseIf option == OIDCumDrain
		SetInfoText("$HP_MCM_CumDrainDescription")	
		
	ElseIf option == OIDCumBellySizeMax
		SetInfoText("$HP_MCM_CumBellySizeMaxDescription")	
		
	ElseIf option == OIDCumBellySizeMaxRandomizer
		SetInfoText("$HP_MCM_CumBellySizeMaxRandomizerDescription")	
		
	ElseIf option == OIDCumBellySizePerCum
		SetInfoText("$HP_MCM_CumBellySizePerCumDescription")	
		
	ElseIf option == OIDCumInflationCreaturesOnly
		SetInfoText("$HP_MCM_CumInflationCreaturesOnlyDescription")	
		
	ElseIf option == OIDPregnancyDuration
		SetInfoText("$HP_MCM_PregnancyDurationDescription")
		
	ElseIf option == OIDMaxScaleBelly
		SetInfoText("$HP_MCM_MaxScaleBellyDescription")
		
	ElseIf option == OIDMaxScaleBreasts
		SetInfoText("$HP_MCM_MaxScaleBreastsDescription")
		
	ElseIf option == OIDMaxScaleBodyWeight
		SetInfoText("$HP_MCM_MaxScaleBodyWeightDescription")
	
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
		
	ElseIf option == OIDBodyWeightScaling
		SetInfoText("$HP_MCM_BodyWeightScalingDescription")
    
	ElseIf option == OIDPCMilking
		SetInfoText("$HP_MCM_PCMilkingDescription")
		
	ElseIf option == OIDNPCMilking
		SetInfoText("$HP_MCM_NPCMilkingDescription")
		
	ElseIf option == OIDNPCSelfMilking
		SetInfoText("$HP_MCM_NPCSelfMilkingDescription")
		
	ElseIf option == OIDMilkAllPC
		SetInfoText("$HP_MCM_MilkAllPCDescription")
		
	ElseIf option == OIDMilkAllNPC
		SetInfoText("$HP_MCM_MilkAllNPCDescription")
		
	ElseIf option == OIDPostPregnancyEffects
		SetInfoText("$HP_MCM_PregnancyPostPregnancyEffectsDescription")
		
	ElseIf option == OIDAllowAnal
		SetInfoText("$HP_MCM_PregnancyAllowAnalDescription")
		
	ElseIf option == OIDAllowNonUnique
		SetInfoText("$HP_MCM_PregnancyAllowNonUniqueDescription")
		
	ElseIf option == OIDSoulGemDuration
		SetInfoText("$HP_MCM_SoulGemDurationDescription")
		
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
	hentaiPregnancyQuest.RegisterForKey(Hotkey)

endEvent

state Hotkey
	event OnKeyMapChangeST(int newKeyCode, string conflictControl, string conflictName)
		hentaiPregnancyQuest.UnregisterForAllKeys()
		bool continue = true
 
		; Check for conflict
		if conflictControl != ""
			string msg
			if conflictName != ""
				msg = "This key is already mapped to:\n'" + conflictControl + "'\n(" + conflictName + ")\n\n Are you sure you want to continue?"
			else
				msg = "This key is already mapped to:\n'" + conflictControl + "'\n\n Are you sure you want to continue?"
			endIf
			continue = ShowMessage(msg, true, "Yes", "No")
		endIf

		; Set allowed key change
		if continue
			Hotkey = newKeyCode
			SetKeyMapOptionValueST(newKeyCode)
		endIf
		hentaiPregnancyQuest.RegisterForKey(Hotkey)
	endEvent

	event OnHighlightST()
		SetInfoText("Key ID " + Hotkey + "\n Shows information about player pregnancy.\n Holding Notification Key for 2 seconds toggles self milking.")
	endEvent
endState

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
				Remainder = hentaiPregnancyQuest.PregnantActors[i].getPostDurationHours() - hentaiPregnancyQuest.PregnantActors[i].getCurrentHour()
				TimeDesc += hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(2)
				if Remainder > 24
					;postpregnancy days left
					Remainder = Remainder / 24
					TimeDesc = hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(1) + hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(2)
				endif
			endif
			;(soulgem)(post)pregnancy days, hours left
			if hentaiPregnancyQuest.getMotherState((hentaiPregnancyQuest.PregnantActors[i].GetActorRef())) != "CumInflated"
				plist[i] = plist[i] + hentaiPregnancyQuest.PregnantActors[i].getMother().GetDisplayName() + hentaiPregnancyQuest.Strings.ShowHentaiPregnancyConfigStrings(3) + hentaiPregnancyQuest.PregnantActors[i].getFather().GetLeveledActorBase().GetName() + " ~ " + Remainder + TimeDesc
			else
				plist[i] = plist[i] + hentaiPregnancyQuest.PregnantActors[i].getMother().GetDisplayName()
			endIf
		endif
		i += 1
	endWhile
	return plist
endFunction