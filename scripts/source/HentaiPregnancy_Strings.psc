Scriptname HentaiPregnancy_Strings extends Quest

string[] Property HentaiPregnantActorAliasStrings Auto Hidden
string[] Property HentaiMilkSquirtEffectStrings Auto Hidden
string[] Property HentaiImpregnatedStrings Auto Hidden
string[] Property HentaiPregnancyStrings Auto Hidden
string[] Property HentaiPregnancyConfigStrings Auto Hidden

Function ResetStrings()
	HentaiImpregnatedStrings = new string[1]
	HentaiImpregnatedStrings[0] = " is no longer inflated."

	HentaiPregnantActorAliasStrings = new string[9]
	HentaiPregnantActorAliasStrings[0] = "It seems due to pregnancy you breasts started lactating."
	HentaiPregnantActorAliasStrings[1] = "Your breasts are full of milk."
	HentaiPregnantActorAliasStrings[2] = " is no longer pregnant."
	HentaiPregnantActorAliasStrings[3] = "'s post pregnancy has ended."
	HentaiPregnantActorAliasStrings[4] = "As your pregnancy has ended, you feel your breasts no longer produce any milk."
	HentaiPregnantActorAliasStrings[5] = "'s pregnancy terminated."
	HentaiPregnantActorAliasStrings[6] = " is full of soul gems, gem seed was absorbed."
	HentaiPregnantActorAliasStrings[7] = " is so full of cum, her belly can't hold anymore."
	HentaiPregnantActorAliasStrings[8] = " milk left."
	
	HentaiMilkSquirtEffectStrings = new string[4]
	HentaiMilkSquirtEffectStrings[0] = "You squirt your delicious breast milk into a jug."
	HentaiMilkSquirtEffectStrings[1] = "You playfully squirt breast milk everywhere!"
	HentaiMilkSquirtEffectStrings[2] = "You playfully squeeze breasts, unfortunately they don't have much milk."
	HentaiMilkSquirtEffectStrings[3] = "Your breasts has some more milk left."

	HentaiPregnancyStrings = new string[10]
	HentaiPregnancyStrings[0] = "All named pregnancies removed."
	HentaiPregnancyStrings[1] = " is impregnating "
	HentaiPregnancyStrings[2] = " is cum inflating "
	HentaiPregnancyStrings[3] = " has planted a gem seed in "
	HentaiPregnancyStrings[4] = " birthed soul gems"
	HentaiPregnancyStrings[5] = " does not have NPC L Breast, check your skeleton, breast scaling is disabled"
	HentaiPregnancyStrings[6] = " does not have NPC R Breast, check your skeleton, breast scaling is disabled"
	HentaiPregnancyStrings[7] = " does not have NPC Belly node, check your skeleton, belly scaling is disabled"
	HentaiPregnancyStrings[8] = " breastfeeds milk to "
	HentaiPregnancyStrings[9] = "'s breasts has some more milk left."
	
	HentaiPregnancyConfigStrings = new string[4]
	HentaiPregnancyConfigStrings[0] = "hours left"
	HentaiPregnancyConfigStrings[1] = " days left"
	HentaiPregnancyConfigStrings[2] = " (Post)"
	HentaiPregnancyConfigStrings[3] = " By "
		
EndFunction

int Function GetVersion()
	return 3
EndFunction

String Function ShowHentaiImpregnatedStrings(Int StringID)
	return HentaiImpregnatedStrings[StringID]
EndFunction

String Function ShowHentaiPregnantActorAliasStrings(Int StringID)
	return HentaiPregnantActorAliasStrings[StringID]
EndFunction

String Function ShowHentaiMilkSquirtEffectStrings(Int StringID)
	return HentaiMilkSquirtEffectStrings[StringID]
EndFunction

String Function ShowHentaiPregnancyStrings(Int StringID)
	return HentaiPregnancyStrings[StringID]
EndFunction

String Function ShowHentaiPregnancyConfigStrings(Int StringID)
	return HentaiPregnancyConfigStrings[StringID]
EndFunction

