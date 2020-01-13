Scriptname HentaiPregnancy_Dialogue extends Quest

;script wont work in CK, cuz CK is sheet, generate random empty script and use tes5edit to set correct script name and fragments

;---Contents---
;
;Function Init_Milking(Actor akActor1, Actor akActor2)	;Initiate Breastfeeding through sexlab
;
;dialogue script fragments
;Function Fragment_01(Actor akSpeakerRef)				;Breastfeeding(Player sucking milk)
;Function Fragment_02(Actor akSpeakerRef)				;Breastfeeding(Player's milk being sucked)
;------

Function Init_Milking(Actor akActor1, Actor akActor2)
	HentaiPregnancy HentaiP = Quest.GetQuest("HentaiPregnancyQuest") as HentaiPregnancy
	
	actor[] sexActors = new actor[2]
	sslBaseAnimation[] anims
	anims = new sslBaseAnimation[1]

	;sexActors[]: 0 - actor being sucked, 1 - actor sucking
	sexActors[0] = akActor1
	sexActors[1] = akActor2

	if sexActors[1].GetLeveledActorBase().GetSex() == 0
		anims[0] = HentaiP.SexLab.AnimSlots.GetbyRegistrar("zjBreastFeedingVar")	;Straight
	else
		anims[0] = HentaiP.SexLab.AnimSlots.GetbyRegistrar("zjBreastFeeding")		;Lesbian
	endif

	HentaiP.SexLab.StartSex(sexActors, anims)
EndFunction

;----------------------------------------------------------------------------------------------------
;
;Script Fragments
;
;----------------------------------------------------------------------------------------------------

Function Fragment_01(ObjectReference akSpeakerRef)
	Actor akSpeaker = akSpeakerRef as Actor
	Init_Milking(akSpeakerRef as actor, Game.Getplayer())
EndFunction

Function Fragment_02(ObjectReference akSpeakerRef)
	Actor akSpeaker = akSpeakerRef as Actor
	Init_Milking(Game.Getplayer(), akSpeakerRef as actor)
EndFunction
