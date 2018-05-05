Scriptname HentaiPregnancy_Strings extends Quest

string[] Property HentaiPregnantActorAliasStrings Auto Hidden
string[] Property HentaiMilkSquirtEffectStrings Auto Hidden
string[] Property HentaiImpregnatedStrings Auto Hidden
string[] Property HentaiPregnancyStrings Auto Hidden
string[] Property HentaiPregnancyConfigStrings Auto Hidden

Function ResetStrings()
	HentaiImpregnatedStrings = new string[1]
	HentaiImpregnatedStrings[0] = " is no longer inflated"

	HentaiPregnantActorAliasStrings = new string[6]
	HentaiPregnantActorAliasStrings[0] = "It seems due to pregnancy you breasts started lactating"
	HentaiPregnantActorAliasStrings[1] = "Your breasts are full of milk"
	HentaiPregnantActorAliasStrings[2] = " is no longer pregnant"
	HentaiPregnantActorAliasStrings[3] = "'s post pregnancy has ended"
	HentaiPregnantActorAliasStrings[4] = "As your pregnancy has ended you feel your breasts no longer produce any milk"
	HentaiPregnantActorAliasStrings[5] = "'s pregnancy terminated"
	
	HentaiMilkSquirtEffectStrings = new string[3]
	HentaiMilkSquirtEffectStrings[0] = "You begin squeezing your delicious breast milk into a jug."
	HentaiMilkSquirtEffectStrings[1] = "You playfully squeeze breast milk everywhere!"
	HentaiMilkSquirtEffectStrings[2] = "You playfully squeeze breasts, unfortunately they don't have much milk."

	HentaiPregnancyStrings = new string[8]
	HentaiPregnancyStrings[0] = "All named pregnancies removed"
	HentaiPregnancyStrings[1] = " is impregnating "
	HentaiPregnancyStrings[2] = " is cum inflating "
	HentaiPregnancyStrings[3] = " has planted a gem seed in "
	HentaiPregnancyStrings[4] = " birthed a Soul Gems"
	HentaiPregnancyStrings[5] = " does not have NPC L Breast, check your skeleton, breast scaling is disabled"
	HentaiPregnancyStrings[6] = " does not have NPC R Breast, check your skeleton, breast scaling is disabled"
	HentaiPregnancyStrings[7] = " does not have NPC Belly node, check your skeleton, belly scaling is disabled"
	
	HentaiPregnancyConfigStrings = new string[5]
	HentaiPregnancyConfigStrings[0] = "hours left"
	HentaiPregnancyConfigStrings[1] = " days left"
	HentaiPregnancyConfigStrings[2] = " (Post)"
	HentaiPregnancyConfigStrings[3] = " By "
		
EndFunction

int Function Getversion()
	return 1
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

